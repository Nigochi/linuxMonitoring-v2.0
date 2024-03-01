#!/bin/bash

function clean_log {
    logs="$(cat ../02/log.txt | awk -F'  ' '{print $1}'))"
    reg='^\/'
    for i in $logs:
    do
        if [[ $i =~ $reg ]]
        then
            sudo rm -rf $i
        fi
    done
}

function clean_mask {
    echo "Write mask for files (example: asda_DDMMYY)"
    read -p "Write mask for files:: " mask
    prefix=$(echo "$mask" | awk -F'_' '{print $1}')

    if [[ $prefix -lt 5 ]]
    then
        count=${#prefix}
        our_mask="$(echo ${prefix:0:1})"
        for (( i=0; i<5-count; i++ ))
        do
            our_mask+="$(echo ${prefix:0:1})"
        done
        our_mask+="$(echo ${prefix:1:${#prefix}})"
        our_mask+="*"
        our_mask+="_"
        our_mask+=$(echo "$mask" | awk -F'_' '{print $2}')
    else
        our_mask=$(echo "$mask" | awk -F'_' '{print $1}')
        our_mask+="*"
        our_mask+="_"
        our_mask+=$(echo "$mask" | awk -F'_' '{print $2}')
    fi
    
    find / -name $our_mask | xargs rm -rf
}