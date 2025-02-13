from future.utils import viewitems, viewvalues
from miasm.analysis.binary import Container
from miasm.analysis.machine import Machine
from miasm.core.locationdb import LocationDB
from miasm.analysis.simplifier import *
from miasm.expression.expression import *
from miasm.core.asmblock import *
from miasm.arch.x86.arch import mn_x86
from miasm.core.utils import encode_hex
from miasm.ir.ir import IRCFG
from miasm.expression.expression import ExprId, ExprInt, ExprMem


import json
import os


from argparse import ArgumentParser
import time
import logging
import pprint
from mod_utils import get_cff_info, find_state_var_usedefs, resolve_jump_target


# 절대 경로 사용 (추천)

#with open('state_changes.json', 'r') as file:
#    state_changes = json.load(file)
    
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
    """
    Flattening 해제 함수: 정적 및 동적 분석 결합.
    """
    main_asmcfg, main_ircfg = func_info
    machine = Machine(cont.arch)
    mdis = machine.dis_engine(cont.bin_stream, loc_db=loc_db)

    print(f"[INFO] Deobfuscation 시작: {hex(ad)}")

    # GDB에서 추출한 state 정보 불러오기
    state_address = None
    state_changes = []
    state_json_path = "gdb_deflatten/state_changes.json"

    if os.path.exists(state_json_path):
        with open(state_json_path, 'r') as file:
            state_info = json.load(file)
            state_address = int(state_info["state_address"], 16)
            state_changes = state_info["state_changes"]

        print(f"[INFO] GDB 추적된 state 주소: {hex(state_address)}, 변경 내역: {state_changes}")
    else:
        print("[WARNING] GDB state 정보를 찾을 수 없음. 정적 분석만 진행.")

    # 정적 분석: relevant_blocks 및 dispatcher 찾기
    relevant_blocks, dispatcher, pre_dispatcher = get_cff_info(main_asmcfg, loc_db)

    if dispatcher is None:
        print("[ERROR] dispatcher를 찾을 수 없음. 분석 중단.")
        return {}

    # dispatcher 블록 찾기
    dispatcher_blk = main_asmcfg.getby_offset(dispatcher)
    if not dispatcher_blk:
        print(f"[ERROR] dispatcher 블록 ({hex(dispatcher)}) 찾기 실패")
        return {}

    # dispatcher에서 state 변수를 찾기
    state_var = None
    for instr in dispatcher_blk.lines:
        if instr.name == "MOV":
            args = instr.get_args_expr()
            if len(args) >= 2 and isinstance(args[0], ExprMem):
                potential_state_var = args[0]
                # 🔥 **주소 값으로 직접 비교하도록 수정 (Miasm 최신 버전 호환)**
                if isinstance(potential_state_var, ExprMem) and potential_state_var.ptr == state_address:
                    state_var = potential_state_var
                    print(f"[DEBUG] dispatcher에서 state 변수 찾음: {state_var}")
                    break

    # GDB 데이터 기반으로 state 변수 보완
    if state_var is None and state_address:
        state_var = ExprMem(ExprInt(state_address, 64), 4)  # ✅ 최신 버전 호환 (size 추가)
        print(f"[WARNING] dispatcher에서 state 변수를 찾지 못함. GDB 데이터 사용: {state_var}")
    else:
        print(f"[INFO] 최종 결정된 state 변수: {state_var}")

    # ✅ **find_and_patch_state_var 함수 추가**
    patches = find_and_patch_state_var(main_ircfg, state_var)

    return patches


def find_and_patch_state_var(ircfg, state_var):
    """
    state 변수를 추적하고 패치를 적용하는 함수.
    """
    patches = {}

    for addr, block in ircfg.blocks.items():
        for instr in block:
            if state_var in instr.get_r():
                print(f"[DEBUG] state 변수를 읽는 블록 발견 @ {hex(addr)}: {instr}")
            if state_var in instr.get_w():
                print(f"[DEBUG] state 변수를 쓰는 블록 발견 @ {hex(addr)}: {instr}")
                patches[addr] = b'\x90' * 5  # 예제: NOP 패치

    return patches



    # ✅ GDB 수집한 state 값이 존재할 때만 패치 수행
    if not should_deflatten(state_var.arg if isinstance(state_var, ExprInt) else 0):
        print(f"[INFO] GDB 결과에 해당 state({state_var})가 없으므로 패치 건너뜁니다.")
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

        if not nop_addrs:
            print(f"[WARNING] {hex(addr)}에서 state_var({state_var}) 사용 블록 없음. 전체 블록 탐색 중...")
            for blk_addr in ircfg.blocks:
                real_addr = ircfg.loc_db.get_location_offset(blk_addr)
                print(f"[DEBUG] 전체 블록 {hex(real_addr)}의 명령어 분석 중...")
                for assignblk in ircfg.blocks[blk_addr]:
                    print(f"[DEBUG] 명령어: {assignblk}")
                    if "IRDst" in str(assignblk):
                        target = list(assignblk.items())[0][1]
                        print(f"[DEBUG] IRDst 발견: {assignblk}, 대상 주소: {hex(target.arg) if isinstance(target, ExprInt) else target}")
                        diff = abs(target.arg - state_var_val) if isinstance(target, ExprInt) else None
                        if diff is not None and diff <= tolerance:
                            print(f"[DEBUG] IRDst가 state_var와 유사한 값입니다. (차이: {diff})")

                        # ✅ 간접 참조 블록 탐지
                        indirect_ref = ircfg.get_block(target.arg)
                        if indirect_ref:
                            print(f"[DEBUG] IRDst가 참조하는 간접 블록 발견: {hex(target.arg)}")
                            for inner_blk in indirect_ref:
                                print(f"[DEBUG] 간접 블록 명령어: {inner_blk}")

        if nop_addrs:
            rel_blk_info[addr] = (asmcfg, nop_addrs)
        else:
            print(f"[ERROR] state_var {state_var}를 사용하는 블록을 찾지 못했습니다.")
            
    # 🔥 패치 데이터 생성 (예제)
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

            if patches:
                for offset, data in patches.items():
                    # LocKey를 정수형 오프셋으로 변환
                    if isinstance(offset, LocKey):
                        offset = loc_db.get_location_offset(offset)

                    # ✅ state 변화가 감지된 경우에만 패치 적용
                    if should_deflatten(offset):
                        print(f"[PATCH] {hex(offset)} 위치에 패치 적용 중...")
                        fpatch.seek(offset - bin_base_addr)
                        fpatch.write(data)
                    else:
                        print(f"[SKIP] {hex(offset)} 위치는 GDB 분석 결과에서 제외됨.")



    fpatch.close()
    deobf_end_time = time.time() - deobf_start_time

    _log.info("Deobfuscated file saved at '%s' (Total Time Taken : %.2f secs)" % (args.patch_filename, deobf_end_time))
    
    
    
def get_cff_info(asmcfg, loc_db):
    """
    Flattening된 블록을 분석하고 dispatcher 블록을 찾는 함수.
    """
    print("[DEBUG] get_cff_info() 실행 시작")

    relevant_blocks = set()
    dispatcher = None
    pre_dispatcher = None
    jmp_blocks = []

    for block in asmcfg.blocks:
        if not block.lines:
            continue  # 빈 블록 스킵

        block_addr = loc_db.get_location_offset(block.loc_key)
        print(f"[DEBUG] 블록: {hex(block_addr)}")

        for instr in block.lines:
            if "MOV" in instr.name:
                args = instr.get_args_expr()
                if args and len(args) > 1 and isinstance(args[0], ExprMem) and isinstance(args[1], ExprInt):
                    print(f"[DEBUG] 찾은 MOV: {instr}")
                    relevant_blocks.add(block_addr)

            if "JMP" in instr.name:
                jmp_blocks.append(block_addr)

    relevant_blocks = sorted(relevant_blocks)

    # dispatcher는 가장 먼저 등장하는 JMP 블록
    if jmp_blocks:
        dispatcher = jmp_blocks[0]
    else:
        dispatcher = relevant_blocks[0] if relevant_blocks else None

    pre_dispatcher = relevant_blocks[1] if len(relevant_blocks) >= 2 else None

    print(f"[DEBUG] get_cff_info() 종료, relevant_blocks 개수: {len(relevant_blocks)}")
    print(f"[DEBUG] dispatcher: {dispatcher}, pre_dispatcher: {pre_dispatcher}")

    return relevant_blocks, dispatcher, pre_dispatcher

#test1#