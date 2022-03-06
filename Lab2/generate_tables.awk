BEGIN{FS = ","
#	print "Car_ID" "|" "Year" "|" "Make" "|" "Model" > "cars_table.csv"
#	print "Judge_ID" "|" "Judge_Name" > "judges_table.csv"
#	print "Car_ID" "|" "Scores" > "car_scores.csv"
}
#BODY
{
       	print $7","$4","$5","$6","$2","$3 > "cars_table.csv"
	if(NR==1){print $8","$9","$1 > "jHeader.csv"}
	else{print $8","$9","$1 > "jInfo.csv"}
        print $7","$10","$11","$12","$13","$14","$15","$16","$17","$18","$19","$20","$21","$22","$23","$24","$25","$26","$27","$28","$29","$30","$31","$32","$33","$34 > "car_scores.csv"
}
END{}
