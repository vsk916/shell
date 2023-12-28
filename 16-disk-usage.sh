#!/bin/bash

Disk_usage=$(df -h | grep -vE 'File|tmp')
Disk_Threshold=1
message=""

while IFS= read -r line
do 
    usage=$(echo $line |awk '{print $5F}'|cut -d % -f1)
    partition=$(echo $line | awk '{print $1F}')
    if [ $usage -gt $Disk_Threshold ]
    then
    message+="High disusage  on $partition: $usage"
    fi
done <<< $Disk_usage

  echo "Message: $message"