#!/bin/bash

# Place arg1, arg2 and correct answer as testnum array.
testnum=(
88 33 11 
132 276 12 
200 500 100
6101 18743 1
204476 154411 527
9223372036854775807 8970676912557384689 126347562148695559 
9223372036854775783 3 1
9223372036854775783 9223372036854775643 1
9223371873002223329 9223371800114211497 3037000493
neko saru 0
1.23 2 0
2 3.58 0
鼠 35 0
38 さ 0
)
prog="./kf_kadai3.sh"
numsample=$((${#testnum[@]}/3)) 


for i in $(seq $numsample)
do
        j=$((i-1))
        arg1=${testnum[$((j*3))]}
        arg2=${testnum[$((j*3+1))]}
        correctans=${testnum[$((j*3+2))]}
	returnans=$($prog "$arg1" "$arg2")
        if [ "$returnans" -eq "$correctans" ]; then
                echo -e "\e[32m✓ case $i\e[m"
        elif [ $? -gt 0 ] && [ "$correctans" -eq 0 ]; then
                echo -e "\e[32m✓ case $i\e[m"
	else
        	echo -e "\e[31m✗ Oops! something is wrong... case $i\e[m"
	fi
done

