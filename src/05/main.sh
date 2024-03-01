#!/bin/bash

if [ $# != 1 ]; then
    echo "Error: there should be only 1 parameter."
else

    . ./decide.sh
    . ./search.sh

    export param=$1

    if [[ $param < 1 || $param > 4 ]]; then
        echo "Error: parameter has a value of 1, 2, 3 or 4."
        exit 1
    fi

    decide
fi