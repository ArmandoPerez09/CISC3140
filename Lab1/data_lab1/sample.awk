BEGIN{FS = ","}
#BODY
{	
	total = 0
	for (i = 8; i <= NF; ++i) {
		total = total + $i
	}
	print total "\t" $7 "\t" $4 "\t" $5 "\t" $6 > "output"
}
