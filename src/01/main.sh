#!/bin/bash

if [ $# != 6 ]
then
    echo "Error: it is not clear why you need not 6 parameters."
else
    . ./error.sh
    . ./free_space.sh
    . ./generator.sh

    export path=$1
    export folder_num=$2
    export letters_folder=$3
    export file_num=$4
    export letters_file=$5
    export size=$6

    check_errors

    free=$(check_free_space)
    if [[ $free == 1 ]]; then
        generate_folder
    else
        echo "Error: not enough free space."
    fi
fi