#!/bin/bash

function generate_folder () {
    touch log.txt
    for (( i=0; i <= $folder_num; i++ ))
    do
        foldername=""
        if [[ ${#letters_folder} < 4 ]]; then
            folder_less_4
            echo $path"/"$foldername " " $(date +"%d%m%y") " " >> log.txt
            generate_file
        else
            folder_more_4
            echo $path"/"$foldername " " $(date +"%d%m%y") " " >> log.txt
            generate_file
        fi
    done
}

function generate_file () {
    before_dot="$(echo $letters_file | awk -F "." '{print $1}')"
    after_dot="$(echo $letters_file | awk -F "." '{print $2}')"
    for (( j=0; j <= $file_num; j++ ))
    do
        filename=""
        if [[ ${#before_dot} < 4 ]]; then
            file_less_4
            echo $path"/"$foldername " " $(date +"%d%m%y") " " $size >> log.txt
        else
            file_more_4
            echo $path"/"$foldername " " $(date +"%d%m%y") " " $size >> log.txt
        fi
    done
}

function file_less_4 () {
    for (( k=0; k < 5 - ${#before_dot}; k++ ))
    do
        filename+="${before_dot:0:1}"
    done
    filename+="${before_dot:1:${#before_dot}}"
    filename+="$j"
    filename+="_"
    filename+=$(date +"%d%m%y")
    filename+="."
    filename+="$after_dot"
    fallocate -l ${size%%kb}"KB" ./$foldername/$filename

    free=$(check_free_space)
    if [[ $free == 0 ]]; then
        echo "Error: not enough space left."
        exit 1
    fi
}

function file_more_4 () {
    filename="$before_dot"
    filename+="$j"
    filename+="_"
    filename+=$(date +"%d%m%y")
    filename+="."
    filename+="$after_dot"
    fallocate -l ${size%%kb}"KB" ./$foldername/$filename

    free=$(check_free_space)
    if [[ $free == 0 ]]; then
        echo "Error: not enough space left."
        exit 1
    fi
}

function folder_less_4 () {
    for (( j=0; j < 5 - ${#letters_folder}; j++ ))
    do
        foldername+="${letters_folder:0:1}"
    done
    foldername+="${letters_folder:1:${#letters_folder}}"
    foldername+=$i
    foldername+="_"
    foldername+=$(date +"%d%m%y")
    mkdir $foldername
}

function folder_more_4 () {
    foldername=$letters_folder
    foldername+=$i
    foldername+="_"
    foldername+=$(date +"%d%m%y")
    mkdir $foldername
}
