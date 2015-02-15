#!/bin/bash

depth()
{    
    if [[ $1 -gt 0 ]]
    then	
	local x=1
	
	for (( ; x <= $2; x++ ))
	do
	    
	    mkdir $3/$x
	    
	    depth $(( $1 - 1 )) $2 $3/$x	    
	done	
    fi    
}

breadth()
{
    local deep=$1
    shift
    local width=$1
    shift
    local curdir=()

    if [[ ${deep} -gt 0 ]]
    then
	for dir in $@
	do
	    local wide=1
	    
	    for (( ; wide <= width; wide++ ))
	    do
		mkdir ${dir}/${wide}
		curdir=( ${curdir[@]} ${dir}/${wide} )
	    done
	done
	
	breadth $(( deep - 1 )) ${width} ${curdir[@]}
    fi
}

if [[ $# != 4 ]]
then
    echo "ERROR: invalid number of parameters"
    exit 1
fi

regex='^[0-9]+$'
if ! [[ $1 =~ ${regex} ]]
then
    echo "ERROR: invalid depth"
    exit 1
fi

if ! [[ $2 =~ ${regex} ]]
then
    echo "ERROR: invalid breadth"
    exit 1
fi

if [[ $4 == "depth" ]]
then
    depth $1 $2 $3
elif [[ $4 == "breadth" ]]
then
     breadth $1 $2 $3
else
    echo "ERROR: 4th parameter must be either depth or breadth"
fi
