#Format CSV file and get low, high, and average score of each assignment

BEGIN {
#Print header
	FS=","
	OFS="\t"
	print "Name\tLow\tHigh\tAverage"
}

#Skips the header in CSV file
/[0-9]/{
	#low[$3] stores the VALUE ($4) of the lowest grade in an ARRAY INDEX of $3 (the name of the assignment)
	#First check should check if the value is initialized. Hopefully this ignore problems that would otherwise occur if student gets "0"
	if (low[$3]=="" || $4<low[$3]){
		low[$3]=$4
	}
	#Test if value of current test > highest stored, if so store new highest
	if ($4>high[$3]){
		high[$3]=$4
	}

	#Consecutively add grade value of assignment into proper array index, to be used for average
	sum[$3] += $4

	#Count the number of grades added, to be used for average
	count[$3]++
	#print "$3=" $3
	#print "low[$3]=" low[$3]
	#print "sum[$3]=" sum[$3]
	#print "count=" count[$3]
}
END {

	for (i in sum){
		#print "i=" i
		#print "sum[i]=" sum[i]
		average[i]=sum[i]/count[i]
		printf "%s\t%d\t%d\t%d\n",i,low[i],high[i],average[i]
	}
}
