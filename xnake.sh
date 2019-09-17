#!/bin/bash
R=`tput lines`
C=`tput cols`
clear
startx=`expr $R / 2`
starty=`expr $C / 2`
tput cup $startx $starty

read -s
echo -n x

