#!/bin/bash

ECHOGREY()	{
	echo -e "\e[1;30m${1}\e[0m"
}

ECHORED()	{
	echo -e "\e[1;31m${1}\e[0m"
}

ECHOGREEN()	{
	echo -e "\e[1;32m${1}\e[0m"
}

ECHOYELLOW()	{
	echo -e "\e[1;33m${1}\e[0m"
}

ECHOBLUE()	{
	echo -e "\e[1;34m${1}\e[0m"
}

ECHOFUCHSIA()	{
	echo -e "\e[1;35m${1}\e[0m"
}

ECHOCYAN()	{
	echo -e "\e[1;36m${1}\e[0m"
}

ECHOSILVER()	{
	echo -e "\e[1;38m${1}\e[0m"
}

ASKFORIT() {
	local __VARIABLE=$1
	local __REQUEST=$2
	local __PROMPTED=""

	echo -n "${__REQUEST}: "
	# Put input in array
	read __PROMPTED[${__VARIABLE}]
	# Check if prompt was left empty
	if [ -e ${__PROMPTED[${__VARIABLE}]} ]
	then
		echo "RETRY: no ${__REQUEST} entered"
		exit
	else
		eval ${__VARIABLE}="'${__PROMPTED[${__VARIABLE}]}'"
	fi
}
