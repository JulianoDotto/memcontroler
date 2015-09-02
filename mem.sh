#!/bin/bash

while :
do
	#varTop will execute top command, and will grep the 'KiB Mem' that contains the total memory and used memory
	varTop=`top -bn1 | grep "KiB Mem"`
	#With varTop we can 'isolate' the total and used memory in two var.
	total=`echo $varTop | awk -F' '   '{print $3}'`
	used=`echo $varTop | awk -F' '    '{print $5}'`
	#Here we set a %
	prct=0.9
	#Here we take 90% of the total value
	warnprct=$(echo "scale=2; $total * $prct" | bc)
	#transform the warnprct in int
	warnprct=${warnprct/.*}
	#Compare if memory used it`s above or equal warnprct
	if [ $used -ge $warnprct ];
	then
		#notify the user that the memory is above 90%
		notify-send "Memory used it's above 90%"
		sleep 30
	fi
done


