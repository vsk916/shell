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
    message+="High disk usage  on partition name : $partition: $usage\n"
    fi
done <<< $Disk_usage

  echo -e "Message: $message"

  echo "Please find the Disk usage details $message" | mail -s "Disk usage alert" vamsisaikrishna.pentela@gmail.com

  if [ $? -eq 0 ]
  then 
   echo "Mail has been sent"

  else
   echo -e "Mail has not sent"
   fi
