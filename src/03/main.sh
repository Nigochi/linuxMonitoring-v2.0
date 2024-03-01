#!/bin/bash
. ./decide.sh
. ./clean.sh

if [ $# != 1 ]
then
    echo "Error: it is not clear why you need not 1 parameters."
else

    export option=${1}

    if [[ ${option} > 3 || ${option} < 1 ]]
    then
        echo "Error: parameters are only 1, 2 and 3"
        exit 1
    fi

    to_decide
fi