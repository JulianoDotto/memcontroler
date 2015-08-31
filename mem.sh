#!/bin/bash


#while :
#do
	varTop=`top -bn1 | grep "KiB Mem"`
	total=`echo $varTop | awk -F' '   '{print $3}'`
	used=`echo $varTop | awk -F' '    '{print $5}'`
	prct=0.6 |bc
	warnprct=`echo $total * 0.6 | bc`

	echo $warnprct

#	if [$used -ge $prct]; then
#		echo "opaaaa"
#	else
#		echo "ta de boa"
#	fi		
#done


