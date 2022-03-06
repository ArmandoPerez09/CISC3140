BEGIN{FS = "|"}
#BODY
{
	#tmp hold maker name
	#use tmp name to iterate three times
	#after three times if tmp name == to next name do nothing
	#if tmp name != next name, tmp name = next name
	#repeat
	count = 0
	temp = $3
	if(count >= 2){ false }
	else if(temp != $prev)
	{
		count = 0
		temp = $3
	}
	else
	{
		print $0
		count++
	}
}
END{}
