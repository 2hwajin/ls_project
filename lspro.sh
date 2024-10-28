#!/bin/bash

# 빈 배열 선언
items=()

# ls 명령어의 출력 결과를 배열에 저장
for item in $(ls); do
    items+=("$item")
done

# 배열의 각 항목을 검사
for item in "${items[@]}"; do
    if [ -d "$item" ]; then
        echo "|$item"
        # 하위 파일 출력
        for sub_item in "$item"/*; do
            if [ -e "$sub_item" ]; then  # 파일이나 디렉토리가 존재하는 경우
                # cut을 사용하여 하위 파일 이름만 추출
                filename=$(echo "$sub_item" | cut -d '/' -f 2-)  # '/'로 나누고, 두 번째 필드부터 출력
                echo "|    |$filename"  # 하위 파일 이름 출력
            fi
        done
    else
        echo "|$item"  # 파일 이름 출력
    fi
done

exit 0
