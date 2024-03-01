#!/bin/bash

function check_free_space () {
    available_space=$(df -h /home/ | awk 'FNR == 2 {print $4}' | grep -o '[0-9][.][0-9]')
	
	if [[ $available_space > "1.0" ]]; then
		echo 1
	else
		echo 0
	fi
}