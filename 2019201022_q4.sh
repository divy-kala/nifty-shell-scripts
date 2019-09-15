#!/bin/bash
word=$1
length=${#word}
t1=`echo "$word" | grep -c "[0-9]"`
t2=`echo "$word" | grep -c -E "[@#=\\\$+*&%-]"`
t3=0
[ $length -gt 8 ] && t3=1
#echo $t1 $t2 $t3
if [ $t1 -eq 1 ] && [ $t2 -eq 1 ] && [ $t3 -eq 1 ] ; then
	echo strong
else
	echo weak	
fi





