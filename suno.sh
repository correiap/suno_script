#!/bin/bash

echo "Set id to start from"
read n

echo "set last id"
read x

echo "Enter the report number"
read sc

echo " Create directory to save reports"
mkdir /home/ec2-user/suno/sc$sc

#minimum report size in bytes
minfilesize=6000

echo "Script running..."

while [ $n -le $x ]
do
        #echo "Downloading ID #$n out of $x"
        wget -q -P /home/ec2-user/suno/sc$sc https://membros.sunoresearch.com.br/download/clube-small-caps-$sc/?wpdmdl=$n
	
	#get filesize
        filesize=$(wc -c <"/home/ec2-user/suno/sc$sc/index.html?wpdmdl=$n")
        
	if [ $filesize -gt $minfilesize ]; then
                echo " Small Caps Report found and the size is: " $filesize
        else
                #echo "file should be deleted"
		rm -f /home/ec2-user/suno/sc$sc/index.html?wpdmdl=$n
        fi
	
	n=$(( n+1 ))
done
