#!/bin/bash

# task 1

if [ $# -ne 2 ]
then
    echo "Usage message"
    exit 1
fi

# task 2

if [ ! -f "$1" ]
then
    echo "Input file does not exist"
    exit 1
fi

# task 3

# awk -F , '{print $1, $2, $3, $5, $6, $7, $10, $11}' $1 | tee $2 space_separated_colleges.txt > /dev/null
awk -F , '{print $1, $2, $3, $5, $6, $7, $10, $11}' $1 > $2

# task 4

awk -F , '$3 == "Bachelor'\''s" {print $1}' $1 >> $2

# task 5

awk -F , 'NR > 1 {print $6}' $1 | sort | uniq > temp.txt
