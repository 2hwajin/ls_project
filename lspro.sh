#!/bin/bash

print_contents() {
    local dir=$1
    local indent=$2
    # local dir = $1 : 현재 디렉토리 경로 저장
    # local indent = $2 : 출력할 때 들여쓰기 조정하기 위한 문자열 저장
    
    for sub_item in "$dir"/*; do
        if [ -e "$sub_item" ]; then
            #basename : 파일명 호출
            filename=$(basename "$sub_item")
            echo "${indent}|$filename"

            # 항목이 디렉토리일 경우 재귀 호출
            if [ -d "$sub_item" ]; then
                print_contents "$sub_item" "${indent}|    "
            fi
        else
            echo "${indent}|    |"
        fi
    done
}

items=(*)

for item in "${items[@]}"; do
    if [ -d "$item" ]; then
        echo "|$item"
        print_contents "$item" "|    "
    else
        echo "|$item"
    fi
done

exit 0

# bash lspro.sh로 실행
# 완료 : 코드에서 반복 가능한 부분을 찾아 반복문으로 만들기 => 재귀함수로 구현
