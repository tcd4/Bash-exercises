#!/bin/bash

filter()
{
    for x in $@
    do
	if (( x >= 66 ))
	then
	    echo ${x}
	fi
	
    done
}

average()
{
    avg=0
    for x in $@
    do
	avg=$(( avg + x ))
    done

    avg=$(( avg / $# ))
    echo ${avg}
}

main()
{
    dir=$1
    filesizes=`ls -l $dir | awk '{print $5}'`

    avg=$(average ${filesizes[@]})
    echo ${avg}
    
    filtered=$(filter ${filesizes[@]})
    echo ${filtered[@]}
}

if [[ $# != 1 ]]
then
    echo "Error: invalid number of parameters"
    exit 1
fi

main $1
