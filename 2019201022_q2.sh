#!/bin/bash
fname=$1
mtype=`file --mime-type $fname`
mytype=${mtype#*: }
echo $mytype
line=`grep "$mytype" /usr/share/applications/defaults.list`
echo $line
binary=${line#*=}
echo $binary
binary=${binary%%;*}
echo $binary
exec=`grep -o "Exec=.* " "/usr/share/applications/$binary"`
exec=${exec#*=}
$exec $file
