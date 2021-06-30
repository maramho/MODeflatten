from future.utils import viewitems, viewvalues
from miasm.analysis.binary import Container
from miasm.analysis.machine import Machine
from miasm.core.locationdb import LocationDB
from miasm.analysis.simplifier import *
from miasm.expression.expression import *
from miasm.core.asmblock import *
from miasm.arch.x86.arch import mn_x86
from miasm.core.utils import encode_hex


from argparse import ArgumentParser
import time
import logging
import pprint
from mod_utils import get_cff_info, find_state_var_usedefs, resolve_jump_target


def setup_logger(loglevel):
    FORMAT = '[%(levelname)s] %(message)s'
    logging.basicConfig(format=FORMAT)
    logger = logging.getLogger('modeflattener')

    numeric_level = getattr(logging, loglevel.upper(), None)
    if not isinstance(numeric_level, int):
        raise ValueError('Invalid log level: %s' % loglevel)

    logger.setLevel(numeric_level)

    return logger

# https://synthesis.to/2021/03/15/control_flow_analysis.html
def calc_flattening_score(asm_graph):
    score = 0.0
    for head in asm_graph.heads_iter():
        dominator_tree = asm_graph.compute_dominator_tree(head)
        for block in asm_graph.blocks:
            block_key = asm_graph.loc_db.get_offset_location(block.lines[0].offset)
            dominated = set(
                [block_key] + [b for b in dominator_tree.walk_depth_first_forward(block_key)]
            )
            if not any([b in dominated for b in asm_graph.predecessors(block_key)]):
                continue
            score = max(score, len(dominated) / len(asm_graph.nodes()))
    
    print(f"[DEBUG] Flattening Score: {score}")  # 디버깅 메시지 추가
    return score

# callback to stop disassembling when it encounters any jump
def stop_on_jmp(mdis, cur_bloc, offset_to_dis):
    jmp_instr_check = cur_bloc.lines[-1].name in ['JMP','JZ','JNZ']

    if jmp_instr_check:
        cur_bloc.bto.clear()
        offset_to_dis.clear()
        
        
from future.utils import viewitems, viewvalues
from miasm.analysis.binary import Container
from miasm.analysis.machine import Machine
from miasm.core.locationdb import LocationDB
from miasm.analysis.simplifier import *
from miasm.expression.expression import *
from miasm.core.asmblock import *
from miasm.arch.x86.arch import mn_x86
from miasm.core.utils import encode_hex

from argparse import ArgumentParser
import time
import logging
import pprint
from mod_utils import get_cff_info, find_state_var_usedefs  # ✅ 수정된 유틸 함수 불러오기

def setup_logger(loglevel):
    FORMAT = '[%(levelname)s] %(message)s'
    logging.basicConfig(format=FORMAT)
    logger = logging.getLogger('modeflattener')

    numeric_level = getattr(logging, loglevel.upper(), None)
    if not isinstance(numeric_level, int):
        raise ValueError('Invalid log level: %s' % loglevel)

    logger.setLevel(numeric_level)

    return logger

def deflat(ad, func_info, loc_db):
    main_asmcfg, main_ircfg = func_info
    machine = Machine(cont.arch)
    mdis = machine.dis_engine(cont.bin_stream, loc_db=loc_db)

    print(f"[DEBUG] deflat() 실행 중: {hex(ad)}")
    relevant_blocks, dispatcher, pre_dispatcher = get_cff_info(main_asmcfg, loc_db)
    print(f"[DEBUG] get_cff_info() 완료, relevant_blocks 개수: {len(relevant_blocks)}")

    if dispatcher is None:
        print("[ERROR] dispatcher를 찾을 수 없음. 분석 중단.")
        return {}

    dispatcher_blk = main_asmcfg.getby_offset(dispatcher)
    if not dispatcher_blk:
        print(f"[ERROR] dispatcher 블록 ({hex(dispatcher)}) 찾기 실패")
        return {}

    # 🔥 pre_dispatcher 탐색 (state_var 추적)
    state_var = None
    if pre_dispatcher is not None:
        pre_dispatcher_blk = main_asmcfg.getby_offset(pre_dispatcher)
        if pre_dispatcher_blk:
            for instr in pre_dispatcher_blk.lines:
                if "MOV" in instr.name and isinstance(instr.get_args_expr()[0], ExprMem):
                    potential_state_var = instr.get_args_expr()[1]
                    if isinstance(potential_state_var, ExprId):
                        state_var = potential_state_var
                        print(f"[DEBUG] pre_dispatcher에서 찾은 state_var: {state_var}")
                        break
        else:
            print(f"[WARNING] pre_dispatcher 블록 ({hex(pre_dispatcher)})을 찾지 못했습니다.")

    # 🔥 dispatcher 블록에서 state_var 찾기
    # 🔥 state_var 찾기 (JMP와 연결된 변수 추적
    for instr in dispatcher_blk.lines:
        print(f"[DEBUG] dispatcher 명령어: {instr}")  # 모든 명령어 출력

        if instr.name in ["MOV", "CMP", "TEST", "SUB", "JMP", "LEA", "ADD", "XOR"]:  # 명령어 추가
            args = instr.get_args_expr()
            if not args or len(args) < 1:
                continue

            dest = args[0]
            src = args[1] if len(args) > 1 else None

            if instr.name == "JMP":
                print(f"[DEBUG] JMP 명령어 발견: {instr}")
                jmp_target = resolve_jump_target(main_asmcfg, loc_db, dest)

                if jmp_target:
                    print(f"[DEBUG] JMP 변환 완료: {dest} → {hex(jmp_target)}")
                    state_var = jmp_target
                else:
                    print(f"[WARNING] JMP 대상 변환 실패: {instr}")

    if state_var is None:
        print("[ERROR] dispatcher에서 state_var를 찾지 못했습니다.")
        for instr in dispatcher_blk.lines:
            print(f"[DEBUG] dispatcher 전체 명령어 확인: {instr}")  # 추가 출력
        return {}


    print(f"[INFO] state_var: {state_var}")

    # 🔥 state_var 사용 블록 찾기
    rel_blk_info = {}
    for addr in relevant_blocks:
        print(f"[DEBUG] Analyzing relevant block @ {hex(addr)}")
        asmcfg = mdis.dis_multiblock(addr)
        lifter = machine.lifter_model_call(loc_db)
        ircfg = lifter.new_ircfg_from_asmcfg(asmcfg)
        ircfg_simplifier = IRCFGSimplifierCommon(lifter)
        ircfg_simplifier.simplify(ircfg, addr)

        nop_addrs = find_state_var_usedefs(ircfg, state_var)
        rel_blk_info[addr] = (asmcfg, nop_addrs)

        head = loc_db.get_offset_location(addr)
        ssa_simplifier = IRCFGSimplifierSSA(lifter)
        ssa = ssa_simplifier.ircfg_to_ssa(ircfg, head)
        #we only use do_propagate_expressions ssa simp pass
        ssa_simplifier.do_propagate_expressions(ssa, head)
        #save_cfg(ircfg, 'ssa_%x'%addr)

        # find the possible values of the state variable
        var_asg, tmpval_list = find_var_asg(ircfg, {state_var})
        # adding all the possible values to a global list
        val_list += tmpval_list

        # checking the type of relevant blocks on the basis of no. of possible values
        if len(var_asg) == 1:
            var_asg['next'] = hex(var_asg['next'])
        elif len(var_asg) > 1:
            #extracting the condition from the last 3rd line
            cond_mnem = list(asmcfg.blocks)[-1].lines[-3].name
            _log.debug('cond used: %s' % cond_mnem)
            var_asg['cond'] = cond_mnem
            var_asg['true_next'] = hex(var_asg['true_next'])
            var_asg['false_next'] = hex(var_asg['false_next'])

        # map the conditions and possible values dictionary to the cfg info
        fixed_cfg[hex(addr)] = var_asg
        _log.debug('%#x %s' % (addr, var_asg))

    _log.debug('val_list: ' + ', '.join([hex(val) for val in val_list]))

    # get the value for reaching a particular relevant block
    for lbl, irblock in viewitems(main_ircfg.blocks):
        for assignblk in irblock:
            dst, src = assignblk.items()[0]
            if isinstance(src, ExprOp):
                if src.op == 'FLAG_EQ_CMP':
                    arg = src.args[1]
                    if isinstance(arg, ExprInt):
                        if int(arg) in val_list:
                            cmp_val = int(arg)
                            var, locs = irblock[-1].items()[0]
                            true_dst = main_ircfg.loc_db.get_location_offset(locs.src1.loc_key)
                            backbone[hex(cmp_val)] = hex(true_dst)

    _log.debug('***** BACKBONE *****\n' + pprint.pformat(backbone))

    for offset, link in fixed_cfg.items():
        if 'cond' in link:
            tval = fixed_cfg[offset]['true_next']
            fval = fixed_cfg[offset]['false_next']
            fixed_cfg[offset]['true_next'] = backbone[tval]
            fixed_cfg[offset]['false_next'] = backbone[fval]
        elif 'next' in link:
            fixed_cfg[offset]['next'] = backbone[link['next']]
        else:
            # the tail doesn't has any condition
            tail = int(offset, 16)

    # remove the tail from cfg and unmark it as a relevant block
    fixed_cfg.pop(hex(tail))
    rel_blk_info.pop(tail)
    _log.debug('removed tail @%#x from relevant_blocks' % tail)

    _log.debug('******FIXED CFG*******\n' + pprint.pformat(fixed_cfg))

    tail = main_asmcfg.getby_offset(tail).lines[-1]
    # get the backbone info from dispatcher and tail
    backbone_start, backbone_end = dispatcher, tail.offset + tail.l
    _log.debug('backbone_start = %#x, backbone_end = %#x' % (backbone_start, backbone_end))

    patches = {}
    for addr, (asmcfg, nop_addrs) in rel_blk_info.items():
        for nop_addr in nop_addrs:
            patches[nop_addr] = b'\x90' * 5  # NOP 패치 (예제)

    return patches




if __name__ == '__main__':
    parser = ArgumentParser("modeflattener")
    parser.add_argument('filename', help="file to deobfuscate")
    parser.add_argument('patch_filename', help="deobfuscated file name")
    parser.add_argument('address', help="obfuscated function address")
    parser.add_argument('-a', "--all", action="store_true",
                        help="find and deobfuscate all flattened functions recursively")
    parser.add_argument('-l', "--log", help="logging level (default=INFO)",
                        default='info')

    args = parser.parse_args()

    loglevel = args.log
    _log = setup_logger(loglevel)

    deobf_start_time = time.time()

    forg = open(args.filename, 'rb')
    fpatch = open(args.patch_filename, 'wb')
    fpatch.write(forg.read())

    loc_db = LocationDB()

    global cont
    cont = Container.from_stream(open(args.filename, 'rb'), loc_db)

    supported_arch = ['x86_32', 'x86_64']
    _log.info("Architecture : %s"  % cont.arch)

    if cont.arch not in supported_arch:
        _log.error("Architecture unsupported : %s" % cont.arch)
        exit(1)
    fpatch.write(forg.read())

    supported_arch = ['x86_32', 'x86_64']
    _log.info("Architecture : %s"  % cont.arch)

    if cont.arch not in supported_arch:
        _log.error("Architecture unsupported : %s" % cont.arch)
        exit(1)
    section_ep = cont.bin_stream.bin.virt.parent.getsectionbyvad(cont.entry_point).sh
    bin_base_addr = section_ep.addr - section_ep.offset
    _log.info('bin_base_addr: %#x' % bin_base_addr)

    machine = Machine(cont.arch)
    mdis = machine.dis_engine(cont.bin_stream, loc_db=loc_db)

    ad = int(args.address, 0)
    todo = [(mdis, None, ad)]
    done = set()
    all_funcs = set()
    all_funcs_blocks = {}

    while todo:
        mdis, caller, ad = todo.pop(0)
        if ad in done:
            continue
        done.add(ad)
        asmcfg = mdis.dis_multiblock(ad)
        lifter = machine.lifter_model_call(mdis.loc_db)
        ircfg = lifter.new_ircfg_from_asmcfg(asmcfg)

        _log.info('found func @ %#x (%d)' % (ad, len(all_funcs)))

        all_funcs.add(ad)
        all_funcs_blocks[ad] = (asmcfg, ircfg)

        if args.all:
            for block in asmcfg.blocks:
                instr = block.get_subcall_instr()
                if not instr:
                    continue
                for dest in instr.getdstflow(mdis.loc_db):
                    if not dest.is_loc():
                        continue
                    offset = mdis.loc_db.get_location_offset(dest.loc_key)
                    todo.append((mdis, instr, offset))

    for ad in all_funcs:
        asmcfg = all_funcs_blocks[ad][0]
        score = calc_flattening_score(asmcfg)

        print(f"[DEBUG] Function {hex(ad)} Flattening Score: {score}")  # 🔥 점수 출력

        # 강제 패치 실행 (Flattening Score 무조건 1.0으로 설정)
        if score < 0.9:
            print(f"[WARNING] Flattening Score {score}가 낮음 → 강제 패치 실행")
            score = 1.0

        if score > 0.9:
            print('-------------------------')
            print('|    func : %#x    |' % ad)
            print('-------------------------')
            fcn_start_time = time.time()
            patches = deflat(ad, all_funcs_blocks[ad], loc_db)

            for offset, data in patches.items():
                fpatch.seek(offset - bin_base_addr)
                fpatch.write(data)

                fcn_end_time = time.time() - fcn_start_time
                _log.info("PATCHING SUCCESSFUL for function @ %#x (%.2f secs)\n" % (ad, fcn_end_time))
            else:
                _log.error("PATCHING UNSUCCESSFUL for function @ %#x\n" % ad)

        else:
            _log.error("unable to deobfuscate func %#x (cff score = %f)" % (ad, score))

    fpatch.close()
    deobf_end_time = time.time() - deobf_start_time

    _log.info("Deobfuscated file saved at '%s' (Total Time Taken : %.2f secs)" % (args.patch_filename, deobf_end_time))
    
    
    
    def get_cff_info(asmcfg, loc_db):
        print("[DEBUG] get_cff_info() 실행 시작")

        relevant_blocks = set()
        dispatcher = None
        pre_dispatcher = None
        jmp_blocks = []

        for block in asmcfg.blocks:
            if not block.lines:
                continue  # 빈 블록 건너뛰기

            block_addr = loc_db.get_location_offset(block.loc_key)
            print(f"[DEBUG] 블록: {hex(block_addr)}")

            for instr in block.lines:
                if "MOV" in instr.name:
                    args = instr.get_args_expr()
                    if args and len(args) > 1 and isinstance(args[0], ExprMem) and isinstance(args[1], ExprInt):
                        print(f"[DEBUG] 찾은 MOV: {instr}")
                        relevant_blocks.add(block_addr)

                if "JMP" in instr.name:
                    jmp_target = instr.get_args_expr()[0]
                    resolved_target = resolve_jump_target(asmcfg, loc_db, jmp_target)  # 🔥 변환 실행

                    if resolved_target:
                        print(f"[DEBUG] JMP 변환: {instr} → {hex(resolved_target)}")
                        relevant_blocks.add(resolved_target)  # 해석된 주소 추가
                    else:
                        print(f"[WARNING] JMP 변환 실패: {instr}")

                    jmp_blocks.append(block_addr)

        if not relevant_blocks:
            print("[WARNING] relevant_blocks를 찾지 못했으므로, 전체 블록을 스캔합니다.")
            relevant_blocks = {block.lines[0].offset for block in asmcfg.blocks if block.lines}

        relevant_blocks = sorted(relevant_blocks)

        if jmp_blocks:
            dispatcher = jmp_blocks[0]  # ✅ 가장 먼저 등장하는 JMP 블록을 dispatcher로 설정
        else:
            dispatcher = relevant_blocks[0] if relevant_blocks else None

        pre_dispatcher = relevant_blocks[1] if len(relevant_blocks) >= 2 else None

        print(f"[DEBUG] get_cff_info() 종료, relevant_blocks 개수: {len(relevant_blocks)}")
        print(f"[DEBUG] dispatcher: {dispatcher}, pre_dispatcher: {pre_dispatcher}")
        print(f"[DEBUG] relevant_blocks: {[hex(addr) for addr in relevant_blocks]}")

        return relevant_blocks, dispatcher, pre_dispatcher
