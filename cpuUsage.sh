#! /usr/bin/env bash
# comment: use command ./make-files.sh

cpuUsage=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) ; }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))

if [ ${cpuUsage%.*} -le 17 ]; then
	echo "cpu: | I          "
elif [ ${cpuUsage%.*} -le 35 ]; then
	echo "cpu: | I I        "
elif [ ${cpuUsage%.*} -le 43 ]; then
	echo "cpu: | I I I      "
elif [ ${cpuUsage%.*} -le 60 ]; then
	echo "cpu: | I I I I    "
elif [ ${cpuUsage%.*} -le 77 ]; then
	echo "cpu: | I I I I I  "
else
	echo "cpu: | I I I I I I"
fi

