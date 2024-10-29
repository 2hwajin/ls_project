#!/bin/bash

items=()

for item in $(ls); do
    items+=("$item")
done

for item in "${items[@]}"; do
    if [ -d "$item" ]; then
        echo "|$item"
        for sub_item in "$item"/*; do
            if [ -e "$sub_item" ]; then
                filename=$(echo "$sub_item" | cut -d '/' -f 2-)
                echo "|    |$filename"
            else
                echo "|    |    |"
            fi
                if [ -d "$sub_item" ]; then
                    for low_item in "$sub_item"/*; do
                        if [ -e "$low_item" ]; then
                            filename=$(echo "$low_item" | cut -d '/' -f 3-)
                            echo "|    |    |$filename"
                        else
                            echo "|    |    |    |"
                        fi
                    done
                fi
            done
    else
        echo "|$item"
    fi
done

exit 0

# bash lspro.sh로 실행
# 단점 : 아직 하위 파일 전부가 아닌 디렉토리 => 디렉토리 (2단계)까지만 접근 가능
# 진행 중 : 코드에서 반복 가능한 부분을 찾아 반복문으로 만들기
