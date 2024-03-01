#!/bin/bash

function code_sort () {
    for (( i=1; i <= 5; i++ ))
    do
        sort -k 8 ../04/$i.log
        echo $i.log
    done
}

function uniq_ip () {
    for (( i=1; i <= 5; i++ ))
    do
        awk '{print $1}' ../04/$i.log | sort -u
    done
}

function code_error () {
    for (( i=1; i <= 5; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log
    done
}

function uniq_error_ip () {
    for (( i=1; i <= 5; i++ ))
    do
        awk '$9 ~ /[45][0-9][0-9]/' ../04/$i.log | awk '{print $1}' | sort -u
    done
}