#!/bin/bash

source_file="/tmp/shellscript.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $source_file ]
then
echo -e "Source file : $source_file does not exit"
fi

file_to_delete=$(find $source_file -type f -mtime +14 -name "*.log")

while IFS= read -r line
do 
echo "Deleting file.....$line"
rm -rf $line

done <<< $file_to_delete