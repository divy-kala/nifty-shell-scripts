#!/bin/bash
rename () {

	ext=$1
	for i in *.$ext
	do
		name=`basename $i .$ext`
		if [ "$?" != "0" ] ; then
			echo "filename not valid"
			exit 1
		fi
		mv $i ./${ext}/${name}.$ext 2> /dev/null
		if [ "$?" != "0" ] ; then
			mkdir $ext 2> /dev/null
			mv $i ./${ext}/${name}.$ext 2> /dev/null
			if [ "$?" -ne "0" ] ; then 
				echo "move failed, exiting" 
				exit 1
			fi
		fi
	done

}
if [ "$#" -le 1 ] ; then
	echo "not enough arugments supplied, exiting"
	exit 1
fi
source=$1
cd $source  2> /dev/null
if [ "$?" != "0" ] ; then
	echo "cd to source directory failed, exiting"
	exit 1 
	
fi
shift

if [ "$1" != "all" ] ; then
	for i in $@
	do
		rename $i
	done
else
	for i in *
	do
		ext="${i#*.}"
		rename $ext
	done

fi
