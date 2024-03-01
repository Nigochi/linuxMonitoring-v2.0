#!/bin/bash

if [ $# != 0 ]; then
    echo "Error: should be 0 parameters."
else
    goaccess ../04/*.log --log-format=combined > result.html
fi