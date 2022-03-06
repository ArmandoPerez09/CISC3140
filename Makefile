lab1:
	#awk file produces three seperate files
	#top_3, ranks, and headers (headers added to the final files)
	#moved to Lab1 directory
	awk -f Lab1/new_data.awk Lab1/data_lab1/data.csv
	mv top_3 Lab1
	mv ranks Lab1 
	mv headers Lab1
	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks. Sorts top_3 via maker first then ranks
	#moved to Lab1 directory
	sort -k5,5rn -t '|' Lab1/ranks > "sorted_ranks"
	sort -k3,3 -k5,5rn -t '|' Lab1/top_3 > "top_3"
	mv sorted_ranks Lab1
	mv top_3 Lab1
	#awk file to only take top three cars for each maker
#	awk -f Lab1/top_3.awk Lab1/top_3
	#Adding headers to final files
	#moved to Lab1 directory
	cat Lab1/headers Lab1/sorted_ranks > "sorted_ranks"
	cat Lab1/headers Lab1/top_3 > "top_3"
	mv sorted_ranks Lab1
	mv top_3 Lab1
	#Display the files
	echo "\n\n"
	cat Lab1/data_lab1/data.csv
	echo "\n\n"
	cat Lab1/sorted_ranks
	echo "\n\n"
	cat Lab1/top_3
