#!/bin/bash
url="https://darksky.net/forecast/$1,$2/ca12/en"
echo "Fetching data, please wait..."
set -o pipefail
parse=`wget -O - $url 2> /dev/null | grep "currently ="`
a=`echo $parse | grep -E -o '"temperature":[0-9]{1,}.?[0-9]{0,}'`
b=`echo $parse | grep -P -o '"summary":".*?"'`
res=$?
if [ "$res" -ne "0" ] ; then
	echo "Fetch failed. Exiting."
	exit 1
fi

weather=${b#\"*\":}

temp=${a#\"temperature\":}
echo "The current temperature at ${1}, $2 is $temp degree celcius and the weather is $weather"
