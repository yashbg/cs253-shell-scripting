#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Usage message"
    exit 1
fi

if [ ! -f "$1" ]
then
    echo "Input file does not exist"
    exit 1
fi

awk -F , '{print $1, $2, $3, $5, $6, $7, $10, $11}' $1 > $2
