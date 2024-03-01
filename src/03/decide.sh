#!/bin/bash

function to_decide {

    if [[ $option == 1 ]]; then
        clean_log
        
    elif [[ $option == 3 ]]; then
        clean_mask
    fi
}