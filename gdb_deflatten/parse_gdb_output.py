import re
import json

# GDB 로그 읽기
with open('gdb_deflatten/gdb_output.log', 'r') as file:
    log_data = file.read()

# 📍 특정 패턴 추출 (MOV, JMP, state 변경 감지)
pattern = r"📍 state 변경 감지: (-?\d+) \(주소: (0x[0-9a-fA-F]+)\)"
matches = re.findall(pattern, log_data)

state_data = {}
for value, address in matches:
    if address not in state_data:
        state_data[address] = []
    state_data[address].append(int(value))

# Flattening 패턴이 있는지 확인
flattened_blocks = []
for address, changes in state_data.items():
    if changes == [0, 2, -1]:  # 🎯 특정 패턴 감지 (ex. 상태가 0 → 2 → -1 변하는 경우)
        flattened_blocks.append(address)

# JSON 저장
result = {
    "state_address": list(state_data.keys())[0] if state_data else None,
    "state_changes": state_data,
    "flattened_blocks": flattened_blocks  # ✅ Flattening 패턴이 발생한 블록
}

with open('gdb_deflatten/state_changes.json', 'w') as json_file:
    json.dump(result, json_file, indent=4)

print(f"✅ state_changes.json 생성 완료: {result}")
