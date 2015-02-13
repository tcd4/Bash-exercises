#!/bin/bash

sort()
{
    arr=("$@")
    up=$(( $# - 1 ))
    echo ${arr[@]}
    for (( ; up > 0; --up ))
    do
	for (( i = 0; i < up; ++i ))
	do
	    x=$(( i + 1 ))
	    cur=${arr[$i]}
	    next=${arr[$x]}

	    if [[ ${cur} -gt ${next} ]]
	    then
		arr[i]=${next}
		arr[x]=${cur}
	    fi
	    
	done
	
    done
    echo ${arr[@]}
}

if [[ $# < 1 ]]
then
    echo "ERROR: need parameters"
fi

sort $@
