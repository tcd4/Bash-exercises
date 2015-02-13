#!/bin/bash
#reverse a directory that gets passed as a argument

reverse()
{
    rev=()
    
    for x in $@
    do
	rev=( "${x}" "${rev[@]}" )
    done
    echo ${rev[@]}
}

main()
{
    files=`ls $1`
    revfiles=$(reverse $files)
    echo ${revfiles[@]}
}

if [[ $# != 1 ]]
then
    echo "Error: incorrect number of parameters"
    exit 1
fi

main $1
