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

REMOTE_ORIGIN=$(if [ $(git remote -v | grep "origin" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
REMOTE_42=$(if [ $(git remote -v | grep "vogsphere" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

if [ $REMOTE_42 -eq 1 ]
then
	if [ ! -z "$1" ]
	then
		git remote add github $1
		if [ $(git remote -v | grep "github" | wc -l) -gt 0 ]
		then
			echo -e "$COLOR_BROWN git $COLOR_NC branch$COLOR_GRAY github$COLOR_NC added successfully"
		else
			echo -e "$COLOR_BROWN git $COLOR_NC branch$COLOR_GRAY github$COLOR_NC creation failed"
		fi
	fi
elif [ $REMOTE_ORIGIN -eq 0 ]
then
	if [ ! -z "$1" ]
	then
		git remote add origin $1
		if [ $(git remote -v | grep "origin" | wc -l) -gt 0 ]
		then
			echo -e "$COLOR_BROWN git $COLOR_NC branch$COLOR_GRAY origin$COLOR_NC added successfully"
		else
			echo -e "$COLOR_BROWN git $COLOR_NC branch$COLOR_GRAY origin$COLOR_NC creation failed"
		fi
		git add . &>/dev/null
		git commit -m "Initial Commit" &>/dev/null
		echo -e "$COLOR_BROWN git $COLOR_NC initial commit created"
		git push --set-upstream origin master &>/dev/null
		echo -e "$COLOR_GRAY repository $COLOR_NC pushed successfully"
	fi
fi
