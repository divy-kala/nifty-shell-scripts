#!/bin/bash
file=$1
#ext=${file#*.}

true
if [ ! -f "$file" ]; then
	echo "Please supply a valid file."
	exit 1
fi

case "$file" in
	*.tar.gz)	tar -xvzf "$file"	;; #test on space file
	*.tar)		tar -xvf "$file"	;;
	*.tar.bz2)	tar -xvjf "$file"	;;
	*.bz2)		bzip2 -dk "$file"	;;
	*.zip)		unzip	"$file"		;;
	*.gz)		gunzip	"$file"		;;
	*)		echo "File extension not recognized" ;;
	
esac


	

