#!/bin/bash
TO_TEAM=$1
Alert_type=$2
Body=$3
To_Addre=$4
Subject=$5
Final_Body=$(sed -e 's/TO_TEAM/$TO_TEAM' -e '/Alert_type/$Alert_type' -e 's/Body/$Body' html-templete.html)


echo "$Final_Body" | mail -s "$subject" "$To_Addre"