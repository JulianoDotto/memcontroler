#!/bin/bash

export BEEP=/usr/share/sounds/KDE-Im-Message-In.ogg
alias beep='paplay $BEEP'

while :
do
	#varTop will execute top command, and will grep the 'KiB Mem' that contains the total memory and used memory
	varTop=`top -bn1 | grep "KiB Mem"`
	#With varTop we can 'isolate' the total and used memory in two var.
	total=`echo $varTop | awk -F' '   '{print $3}'`
	used=`echo $varTop | awk -F' '    '{print $5}'`
	#Here we set a %
	prct=0.6
	#Here we take 60% of the total value
	warnprct=$(echo "scale=2; $total * $prct" | bc)
	warnprct=${warnprct/.*}

	if [ $used -ge $warnprct ];
	then
		beep
	fi
done


