#Get weighted final grade for each student

BEGIN {
#Print header
        FS=","
        OFS="\t"
        print "Name\tPercent\tLetter"
}

#Skips the header in CSV file
#Pattern matches type of assignment (HW, Lab, Quiz, or Final)
#TODO: Clean up old code, remove if statement. Don't have time tonight :)
$3~/H/{
	#Weighted values
	HW=.1
	LAB=.3
	QUIZ=.4
	FINAL=.15
	type="H"
	
	#Apparently no switch-case in awk, need gawk
        #select case to determine the weight
	if (type == "H") {
		weight=HW
	}
	else if (type == "L") {
		weight=LAB
	}
	else if (type == "Q") {
		weight=QUIZ
	}
	else if (type == "F") {
		weight=FINAL
	}

	#store grade in sum, eventually divide by count for average
	sum[$1]+=(($4*weight)/$5*100)
	count[$1]+=weight
}
$3~/L/{
        #Weighted values
        HW=.1
        LAB=.3
        QUIZ=.4
        FINAL=.15
        type="L"

        #Apparently no switch-case in awk, need gawk
        #select case to determine the weight
        if (type == "H") {
                weight=HW
        }
        else if (type == "L") {
                weight=LAB
        }
        else if (type == "Q") {
                weight=QUIZ
        }
        else if (type == "F") {
                weight=FINAL
        }

        #store grade in sum, eventually divide by count for average
        sum[$1]+=(($4*weight)/$5*100)
        count[$1]+=weight
}
$3~/Q/{
        #Weighted values
        HW=.1
        LAB=.3
        QUIZ=.4
        FINAL=.15
        type="Q"

        #Apparently no switch-case in awk, need gawk
        #select case to determine the weight
        if (type == "H") {
                weight=HW
        }
        else if (type == "L") {
                weight=LAB
        }
        else if (type == "Q") {
                weight=QUIZ
        }
        else if (type == "F") {
                weight=FINAL
        }

        #store grade in sum, eventually divide by count for average
        sum[$1]+=(($4*weight)/$5*100)
        count[$1]+=weight
}
$3~/F/{
        #Weighted values
        HW=.1
        LAB=.3
        QUIZ=.4
        FINAL=.15
        type="F"

        #Apparently no switch-case in awk, need gawk
        #select case to determine the weight
        if (type == "H") {
                weight=HW
        }
        else if (type == "L") {
                weight=LAB
        }
        else if (type == "Q") {
                weight=QUIZ
        }
        else if (type == "F") {
                weight=FINAL
        }

        #store grade in sum, eventually divide by count for average
        sum[$1]+=(($4*weight)/$5*100)
        count[$1]+=weight
}

END {

        for (i in sum){
                #print "i=" i
                #print "sum[i]=" sum[i]
                average[i]=sum[i]/count[i]
		if (average[i]>="90") {
			letter[i]="A"
		}
		else if (average[i]>="80") {
			letter[i]="B"
		}
		else if (average[i]>="70") {
                        letter[i]="C"
                }
		else if (average[i]>="60") {
                        letter[i]="D"
                }
		#is it "E" or "F"?
		else {
                        letter[i]="F"
                }

                printf "%s\t%d\t%s\n",i,average[i],letter[i]
        }
}

