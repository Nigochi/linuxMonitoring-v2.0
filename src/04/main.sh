#!/bin/bash

if [ $# != 0 ]; then
    echo "Error: there should be 0 parameters."
else

    . ./echo_to_log.sh

    export _date="$(date +%Y)-$(date +%m)-$(date +%d) 00:00:00 $(date +%z)"
    lines_number=$(shuf -n1 -i 100-1000)
    export time=$(shuf -i 20-60 -n1)
    for (( i=1; i <= 5; i++ ))
    do
        export day=$[$i-1]
        export i
        for (( j=0; j<lines_number; j++ ))
        do
            export j
            echo_log
        done
        _date="$(date +%Y)-$(date +%m)-$(date +%d) 00:00:00 $(date +%z)"
        #_date="$(date -d "$date - $((6-$i)) days" +'%Y-%m-%d')"
    done
fi


# 200 - OK
# 201 - Created
# 400 - Bad Request
# 401 - Unauthorized
# 403 - Forbidden
# 404 - Not Found
# 500 - Internal Server Error
# 501 - Not Implemented
# 502 - Bad Gateway
# 503 - Service Unavailable