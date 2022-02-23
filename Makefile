lab1:
	awk -f Lab1/new_data.awk Lab1/data_lab1/data.csv
	mv ranks Lab1 
	mv headers Lab1
	sort -k5,5rn -t '|' Lab1/ranks > "sorted_ranks"
	mv sorted_ranks Lab1
#	cat Lab1/ranks
	cat Lab1/headers Lab1/sorted_ranks > "sorted_ranks"
	mv sorted_ranks Lab1
	cat Lab1/sorted_ranks
