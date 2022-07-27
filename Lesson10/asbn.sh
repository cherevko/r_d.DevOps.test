#!/bin/bash
read -p "Please enter ISBN number in format ISBN xx-xx-xxxxx-x: " isbn
while [[ "$isbn" =~ "[^ISBN [[:digit:]]{1,5}-[[:digit:]]{1,7}-[[:digit:]]{1,6}-[0-9]$]" || -z "$isbn" ]]
do
    echo "The ISBN has incorrect format. Please try again..."
    read -p "Please enter ISBN number: "
#loop until the user enters correct ISBN.
done
n="${isbn//[^[:digit:]]/}"
if [ ${#n} -eq 10 ]
then
	echo "ISBN has 10 digits format. Cheking..."
	arr=( $(fold -w1 <<< "$n") )
	sum=$(((arr[0]*10)+(arr[1]*9)+(arr[2]*8)+(arr[3]*7)+(arr[4]*6)+(arr[5]*5)+(arr[6]*4)+(arr[7]*3)+(arr[8]*2)+arr[9]))
	echo "The sum of ISBN digits is $sum"
	if [ $((sum%11)) -eq 0 ]
	then 
		echo "The 10-digit ISBN number is correct."
		exit
	else
		echo "The 10 digit ISBN number is not correct."
		exit
	fi
elif [ ${#n} -eq 13 ]
then
	echo "ISBN has 13 digits format. Cheking..."
	arr=( $(fold -w1 <<< "$n") )
	sum=$((arr[0]+(arr[1]*3)+arr[2]+(arr[3]*3)+arr[4]+(arr[5]*3)+arr[6]+(arr[7]*3)+arr[8]+(arr[9]*3)+arr[10]+(arr[11]*3)+arr[12]))
	echo "The sum of ISBN digits is $sum"
	if [ $((sum%10)) -eq 0 ]
	then 
		echo "The 13-digit ISBN number is correct."
		exit
	else
		echo "The 13 digit ISBN number is not correct."
		exit
	fi
fi

