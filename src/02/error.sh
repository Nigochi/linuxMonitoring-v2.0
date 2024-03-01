#!/bin/bash

function check_errors () {

    regex='^[a-zA-Z]{1,7}$'
    if ! [[ $letters_dirs =~ $regex ]]; then
        echo "Error: wrong letters for folder name."
        exit 1
    fi

    regex='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'
    if ! [[ $letters_files =~ $regex ]]; then
        echo "Error: wrong letters for file name."
        exit 1
    fi

    regex='^[1-9][0-9]?[0]?Mb$'
    if ! [[ $size =~ $regex ]]; then
        echo "Error: wrong file size."
        exit 1
    fi
}