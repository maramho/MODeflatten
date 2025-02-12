import re
import json

# GDB 출력 파일 읽기
with open('gdb_output.log', 'r') as file:
    log_data = file.read()

# state 변경 추적 (offset 정보 포함)
pattern = r"📍 state 변경 감지: (-?\d+) \(offset: (\d+)\)"
matches = re.findall(pattern, log_data)

# 오프셋별 변경 사항 기록
state_data = {}
for value, offset in matches:
    offset = int(offset)
    if offset not in state_data:
        state_data[offset] = []
    state_data[offset].append(int(value))

# 가장 빈번하게 등장한 offset 선택
most_common_offset = max(state_data, key=lambda k: len(state_data[k]))

# JSON 파일 저장
result = {
    "state_offset": most_common_offset,
    "state_changes": state_data[most_common_offset]
}

with open('state_changes.json', 'w') as json_file:
    json.dump(result, json_file, indent=4)

print(f"✅ state_changes.json 생성 완료: {result}")
