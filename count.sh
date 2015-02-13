#!/bin/sh
#counts how many commands start with each letter

count=( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
index=0
curLetter=
prevLetter=A

for command in //bin/*
do
    curLetter=${command:6:1}
    
    if [[ $curLetter == [a-zA-Z] ]]
    then
	curLetter=${curLetter^}
	
	if [[ ${curLetter} != ${prevLetter} ]]
	then
	    prevLetter=${curLetter}
	    (( index++ ))
	fi

	(( count[ index ]++ ))
    fi
    
done

index=0
for x in {a..z}
do
    echo ${x} ${count[$index]}
    (( index++ ))
done


