#!/bin/bash

items=($(ls))

for item in "${items[@]}"
do
    echo "|$item"
done

exit 0

#ls한 파일 목록을 배열에 담아 출력
#실행 시 bash lspro.sh
