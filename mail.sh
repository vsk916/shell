#!/bin/bash
TO_TEAM=$1
Alert_type=$2
Body=$3
To_Addre=$4
Subject=$5
ESCAPE_BODY=$(printf '%s\n' "$Body" | sed -e 's/[]\/$*.^[]/\\&/g');
Final_Body=$(sed -e 's/TO_TEAM/$TO_TEAM/g' -e 's/Alert_type/$Alert_type/g' -e 's/Body/$Body/g' html-templete.html)


echo "$Final_Body" | mail -s "$(echo -e "$Subject\nContent-Type: text\html")" "$To_Addre"