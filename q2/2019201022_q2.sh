#!/bin/bash
fname="$1"
mytype=`file --mime-type "$fname"`
#echo reading $fname
mytype=${mytype#*: }
#echo type is $mytype
line=`grep -E -m 1 "$mytype" /usr/share/applications/defaults.list`
if [ "$?" != "0" ] ; then
	echo "couldnt find file type in defaults.list. exiting"
	exit 1
fi
#echo line is $line
binary=${line#*=}
binary=${binary%%;*}
#echo binary is $binary
exec=`grep -o -m 1 "Exec=.* " "/usr/share/applications/$binary"`
if [ "$?" != "0" ] ; then
	echo "couldnt open $binary"
	exit 1
fi
#echo line is $line
exec=${exec#*=}
#echo exec is $exec
#echo file is $fname
$exec "$fname"
