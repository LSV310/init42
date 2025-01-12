#!/bin/bash

COLOR_NC='\e[0m'
COLOR_BLACK='\e[0;30m'
COLOR_GRAY='\e[1;30m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\e[1;32m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_LIGHT_GRAY='\e[0;37m'
COLOR_WHITE='\e[1;37m'

LIBFT=$(if [ $(ls -la | grep "libft" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

function add_libft()
{
	git clone https://github.com/LSV310/AG42-Libft.git libft &>/dev/null
	if [ $(ls -la | grep "libft" | wc -l) -gt 0 ]
	then
		echo -e "$COLOR_PURPLE libft $COLOR_NC successfully cloned from$COLOR_GRAY https://github.com/LSV310/AG42-Libft.git $COLOR_NC"
	else
		echo -e "$COLOR_PURPLE libft $COLOR_NC cloning failed"
	fi
	rm -rf libft/.git

	INCLUDES=$(if [ $(ls -la | grep "includes" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

	if [ $INCLUDES -eq 1 ]
	then
		LIBFT_H=$(if [ $(ls -la | grep "includes/libft.h" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
		if [ $LIBFT_H -eq 0 ]
		then
			mv libft/libft.h includes/
		fi
	fi
}

function override()
{
	rm -rf libft
	rm -rf includes/libft.h
	echo -e "$COLOR_PURPLE libft $COLOR_NC removed successfully"
	add_libft
}

if [ -z "$1" ]
then
	if [ $LIBFT -eq 0 ]
	then
		add_libft
	else
		/home/agruet/dev/init42/libft_override
	fi
elif [ "$1" = "confirm" ]
then
	override
else
	if [ "$1" = "cancel" ]
	then
		echo -e "$COLOR_PURPLE libft $COLOR_NC not replaced"
	fi
fi
