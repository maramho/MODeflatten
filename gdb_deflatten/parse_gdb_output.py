import re
import json

# GDB 출력 파일 읽기
with open('gdb.txt', 'r') as file:
    log_data = file.read()

# 📍 state 변경 감지 패턴
pattern = r"📍 \[DEBUG\] state 변경 감지: (-?\d+) \(주소: (0x[0-9a-fA-F]+)\)"
matches = re.findall(pattern, log_data)

# 🗂️ 데이터 정리
state_data = {}
for value, address in matches:
    if address not in state_data:
        state_data[address] = []
    state_data[address].append(int(value))

# 📊 가장 빈번하게 등장한 주소 선택
most_common_address = max(state_data, key=lambda k: len(state_data[k]))

# ✅ JSON 파일로 저장
result = {
    "state_address": most_common_address,
    "state_changes": state_data[most_common_address]
}

with open('state_changes.json', 'w') as json_file:
    json.dump(result, json_file, indent=4)

print(f"✅ state_changes.json 생성 완료: {result}")
