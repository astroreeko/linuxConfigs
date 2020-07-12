#! /usr/bin/env bash
# comment: use command ./make-files.sh

memUsage=$(free -m | grep Mem | awk '{print ($3/$2)*100}')

if [ ${memUsage%.*} -le 17 ]; then
	echo "mem: | I           "
elif [ ${memUsage%.*} -le 35 ]; then
	echo "mem: | I I         "
elif [ ${memUsage%.*} -le 43 ]; then
	echo "mem: | I I I       "
elif [ ${memUsage%.*} -le 60 ]; then
	echo "mem: | I I I I     "
elif [ ${memUsage%.*} -le 77 ]; then
	echo "mem: | I I I I I   "
else
	echo "mem: | I I I I I I "
fi

