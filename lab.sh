#!/bin/bash

# task 1

if [ $# -ne 2 ]
then
    echo "Provide exactly 2 file names as arguments. The first file argument should be the name of the input csv file, and the second one should be the name of the output file. "
    exit 1
fi

echo >> $2

# task 2

if [ ! -f "$1" ]
then
    echo "Input file does not exist"
    exit 1
fi

echo >> $2

# task 3

# awk -F , '{print $1, $2, $3, $5, $6, $7, $10, $11}' $1 | tee $2 space_separated_colleges.txt > /dev/null
awk -F , '{print $1, $2, $3, $5, $6, $7, $10, $11}' $1 > $2

echo >> $2

# task 4

awk -F , '$3 == "Bachelor'\''s" {print $1}' $1 >> $2

echo >> $2

# task 5

echo Geography: Average Admission Rate >> $2

awk '
	BEGIN {
		FS = ",";
		OFS = ": ";
	}
	NR > 1 {
		adm_rate[$6] += $7;
		count[$6]++;
	}
	END {
		for(geo in adm_rate) {
			avg = adm_rate[geo] / count[geo];
			print geo, avg
		}
	}
' $1 >> $2

echo >> $2

# task 6

sort -r -n -t ',' -k16 $1 | head -n 5 | awk -F , '{print $1}' >> $2
