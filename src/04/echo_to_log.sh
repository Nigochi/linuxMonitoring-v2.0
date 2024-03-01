#!/bin/bash

function echo_log {

    echo -n "$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255).$(shuf -n1 -i 0-255)" >> $i.log
    echo -n " - - " >> $i.log
    echo -n "[$(date -d "$_date -$day day + $time seconds" +'%d/%b/%Y:%H:%M:%S %z')] " >> $i.log
    echo -n \""$(shuf -n1 method) " >> $i.log
    echo -n "$(shuf -n1 url) " >> $i.log
    echo -n "$(shuf -n1 protocol)\" " >> $i.log
    echo -n "$(shuf -n1 ans_code)" >> $i.log
    echo -n " \"-\" " >> $i.log
    echo -n \""$(shuf -n1 agent)\"" >> $i.log
    echo >> $i.log
    (( time+=$(shuf -i 20-60 -n1) ))
}