#!/bin/bash

# this is a case statement

if [[ "$1" == "" ]]
then
	echo "must provide a program to find"
	exit 1
fi
PROCESS=$1


r="$(ps -ef | grep "$PROCESS" | grep -v "$0" | grep -v "grep")" 

case "$r" in

"") echo "did not find process"
    ;;
*) echo "found the process: $PROCESS"
    ;;
esac


# this is an if statement
ps_out=$(ps -ef | grep "$1" | grep -v 'grep' | grep -v "$0")

result=$(echo $ps_out | grep "$PROCESS")

if [[ "$result" != "" ]];then
	ps -ef | grep $PROCESS | awk 'BEGIN{printf "%-5s\t%-30s\n", "PID", "Process"}; {printf "%-5d\t%-30s\n", $1, $8}'    
else
    echo "Not Running"
fi

