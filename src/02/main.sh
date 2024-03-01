#!/bin/bash

. ./error.sh
. ./generator.sh
. ./free_space.sh

if [ $# != 3 ]
then
    echo "Error: it is not clear why you need not 3 parameters."
else

    export letters_folder=${1}
    export letters_files=${2}
    export size=${3}

    check_errors
    
    free=$(check_free_space)
    if [[ $free == 1 ]]; then
        start_script
    else
        echo "Error: not enough free space."
    fi
fi