#!/bin/bash

function start_script {
    touch log.txt
    START=$(date +'%s%N')
    START_TIME=$(date +'%Y-%m-%d %H:%M:%S')
    echo "Script started at $START_TIME" > log.txt
    echo "Script started at $START_TIME"
    count_folder=$(echo $(( 1 + $RANDOM % 100 )))
    do_not_enter='\/[s]?bin'
    for (( num=0; num<$count_folder; num++ ))
    do
        cd /
        path="/"
        foldername=""
        generate_folder
    done
    stop_script
}

function generate_folder {
    count_folder_in_folder=$(echo $(ls -l -d */ 2>/dev/null | wc -l ))

    if [[ $count_folder_in_folder == 0 ]]
    then
        go_to=0
    else
        go_to=$(echo $(( $RANDOM % $count_folder_in_folder )))
    fi

    if [[ $go_to == 0 ]]
    then
        if [[ ${#letters_folder} < 5 ]]
        then
            folder_less_4
        else
            folder_more_4
        fi
        sudo mkdir $path$foldername 2>/home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/folder_err.txt
        if ! [[ -s /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/folder_err.txt ]]
        then
            echo $path$foldername --- $(date +'%Y-%m-%d %H:%M:%S') --- >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
            generate_files
        fi
    else
        path+="$( ls -l -d */ | awk '{print $9}' | sed -n "$go_to"p )"
        if ! [[ $path =~ $do_not_enter ]]
        then
            cd $path
            generate_folder
        fi
    fi
}

function folder_less_4 {
    count=${#letters_folder}
    for (( i=0; i<6-count; i++ ))
    do
        foldername+="$(echo ${letters_folder:0:1})"
    done
    foldername+="$(echo ${letters_folder:1:${#letters_folder}})"
    foldername+=$num
    foldername+="_"
    foldername+=$(date +"%d%m%y")
}

function folder_more_4 {
    foldername=$letters_folder
    foldername+=$num
    foldername+="_"
    foldername+=$(date +"%d%m%y")
}

function generate_files {
    before_dot="$(echo $letters_files | awk -F "." '{print $1}')"
    after_dot="$(echo $letters_files | awk -F "." '{print $2}')"
    count_files=$(echo $(( $RANDOM % 1000 )))
    for (( num_files=0; num_files <$count_files; num_files++ ))
    do
        filename=""
        if [[ ${#before_dot} < 5 ]]
        then
            if ! [[ -s /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt ]]
            then
                files_less_4
                echo $path$foldername"/"$filename --- $(date +'%Y-%m-%d %H:%M:%S') --- $size "Mb" >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
            else
                rm -rf /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt
                break
            fi
        else
            if ! [[ -s /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt ]]
            then
                files_more_4
                echo $path$foldername"/"$filename --- $(date +'%Y-%m-%d %H:%M:%S') --- $size "Mb" >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
            else
                rm -rf /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt
                break
            fi
        fi
    done
}

function files_less_4 {
    count=${#before_dot}
    for (( i=0; i<6-count; i++ ))
    do
        filename+="$(echo ${before_dot:0:1})"
    done
    filename+="$(echo ${before_dot:1:${#before_dot}})"
    filename+=$num_files
    filename+="_"
    filename+=$(date +"%d%m%y")
    filename+="."
    filename+=$after_dot
    sudo fallocate -l $size"MB" $path/$foldername/$filename 2>/home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt
    free=$(check_free_space)
    if [[ $free == 0 ]]; then
        stop_script
        exit 1
    fi
}

function files_more_4 {
    filename+="$(echo ${before_dot:0:${#before_dot}})"
    filename+=$num_files
    filename+="_"
    filename+=$(date +"%d%m%y")
    filename+="."
    filename+=$after_dot
    sudo fallocate -l $size"MB" $path/$foldername/$filename 2>/home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt
    free=$(check_free_space)
    if [[ $free == 0 ]]; then
        stop_script
        exit 1
    fi
}

function stop_script {
    rm -rf /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/folder_err.txt
    rm -rf /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/file_err.txt
    END=$(date +'%s%N')
    END_TIME=$(date +'%Y-%m-%d %H:%M:%S')
    echo "Script finished at $END_TIME" >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
    echo "Script finished at $END_TIME"
    DIFFERENCE=$((( $END - $START ) / 100000000 ))
    echo "Script execution time (in seconds) = $(( $DIFFERENCE / 10 )).$(( $DIFFERENCE % 10 ))" >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
    echo "Script execution time (in seconds) = $(( $DIFFERENCE / 10 )).$(( $DIFFERENCE % 10 ))"
    echo -e "" >> /home/isrealpe/Desktop/DO4_LinuxMonitoring_v2.0-1/src/02/log.txt
}