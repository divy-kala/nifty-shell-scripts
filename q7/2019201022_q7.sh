#!/bin/bash
R=`tput lines`
C=`tput cols`
tput clear
row=`expr $R / 2`
col=`expr $C / 2`
tput civis
tput cup $row $col
echo $row $col

dir="w"
stty -echo
while true; do
	
	tput clear
        read -s -n 1 -t 0.01 dir
	if [ "$dir" = "w" ] ; then
		
		#tput cup $startx `expr $starty + 1`
		row=`expr $row - 1`	
	
	elif [ "$dir" = "s" ] ; then
		#tput cup $startx `expr $starty - 1`
		row=`expr $row + 1`
		
	
	elif [ "$dir" = "a" ] ; then
		#tput cup $startx `expr $starty - 1`
		col=`expr $col - 1`
		
	
	elif [ "$dir" = "d" ] ; then
		#tput cup $startx `expr $starty - 1`
		col=`expr $col + 1`
		
	fi
	if [ $col -le 0 -o $row -le 0 -o $col -ge $C -o $row -ge $R ] ; then
		echo you are dead
		exit
	fi
	
	
	#echo $row $col
	tput cup $row $col
	echo -n "x"
	sleep 0.01
done
function rest {
	tput reset
	tput cnorm
}
trap rest EXIT
