#!/bin/bash

ip="192.168.1."

declare -i count
count=1

echo "" > output

while (( count < 255 ))
do
    val=$(ping -q -c 1 "${ip}$count")

    if (( $? == 1 ))
    then
	echo "Host ${ip}$count is down."
    else
	echo "Host ${ip}$count is up."
	echo "${ip}$count" >> output
    fi
    count=$(( $count + 1 ))
done

