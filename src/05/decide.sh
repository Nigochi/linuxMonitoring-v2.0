#!/bin/bash

function decide () {
    if [[ $param == 1 ]]; then
        code_sort
    fi

    if [[ $param == 2 ]]; then
        uniq_ip
    fi

    if [[ $param == 3 ]]; then
        code_error
    fi
    
    if [[ $param == 4 ]]; then
        uniq_error_ip
    fi
}