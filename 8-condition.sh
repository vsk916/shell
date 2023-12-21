#!/bin/bash

echo -e "Enter number to check \c :"

read number

if [ $number -gt 100 ]
then 
echo "The given number $number is greater than 100"
else
echo "The given number $number is less than 100"

fi
