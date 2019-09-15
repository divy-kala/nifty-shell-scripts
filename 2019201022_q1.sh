#!/bin/bash
url="https://darksky.net/forecast/$1,$2/ca12/en"
echo "Fetching data, please wait..."
set -o pipefail
parse=`wget -O - $url 2> /dev/null | grep "currently =" | grep -E -o '"temperature":[0-9]{1,}.?[0-9]{0,}'`
res=$?
if [ -n $res ] ; then
	echo "Fetch failed. Exiting."
	exit 1
fi
temp=${parse#\"temperature\":}
echo "The current temperature at ${1}, $2 is $temp degree celcius"
