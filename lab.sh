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

awk -F , 'NR > 1 {print $6}' $1 | sort | uniq > geographies.txt

echo Geography: Average Admission Rate >> $2

while read geo
do
    awk -F , '$6 == x {print $7}' x="$geo" $1 > admission_rates.txt
    sum=0
    i=0
    while read adm_rate
    do
        sum=$(echo "$sum + $adm_rate" | bc)
        ((i++))
    done < admission_rates.txt
    avg=$(echo "$sum / $i" | bc)
    echo $geo: $avg >> $2
done < geographies.txt
