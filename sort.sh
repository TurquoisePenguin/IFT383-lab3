#!bin/bash

#store header
header=`awk -f labReport.awk $1 | head -n 1`

#sort the remaining data, and print appropriately
echo "$header"
body=`awk -f labReport.awk $1 | tail -n +2 | sort`
echo "$body"

