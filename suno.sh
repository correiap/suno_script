#!/bin/bash

echo "Set id to start from"
read n

echo "set last id"
read x

echo "Enter the report number"
read sc

mkdir /home/ec2-user/suno/sc$sc

while [ $n -le $x ]
do
        echo "Downloading ID #$n out of $x"
        wget -P /home/ec2-user/suno/sc$sc https://membros.sunoresearch.com.br/download/clube-small-caps-$sc/?wpdmdl=$n
        n=$(( n+1 ))     
done
