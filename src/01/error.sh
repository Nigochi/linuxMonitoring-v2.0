#!/bin/bash

function check_errors () {

    if [[ ! (-d "$path") || "$path" == "" ]]; then
        echo "Error: no such directory."
        exit 1
    fi

    regex='^[1-9][0-9]+?$'
    if ! [[ $folder_num =~ $regex ]]; then
        echo "Error: wrong number of folders."
        exit 1
    fi

    regex='^[1-9][0-9]+?$'
    if ! [[ $file_num =~ $regex ]]; then
        echo "Error: wrong number of files."
        exit 1
    fi

    regex='^[a-zA-Z]{1,7}$'
    if ! [[ $letters_folder =~ $regex ]]; then
        echo "Error: wrong letters for folder name."
        exit 1
    fi

    regex='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
    if ! [[ $letters_file =~ $regex ]]; then
        echo "Error: wrong letters for file name."
        exit 1
    fi

    regex='^[1-9][0-9]?[0]?kb$'
    if ! [[ $size =~ $regex ]]; then
        echo "Error: wrong file size."
        exit 1
    fi
}