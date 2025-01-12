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

GIT=$(if [ $(ls -la | grep ".git" | awk '{printf $1}' | grep "d" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
GITIGNORE=$(if [ $(ls -la | grep ".gitignore" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

if [ $GIT -eq 0 ]
then
	git init &>/dev/null
	if [ $(ls -la | grep ".git" | awk '{printf $1}' | grep "d" | wc -l) -gt 0 ]
	then
		echo -e "$COLOR_BROWN git $COLOR_NC initialized successfully"
	else
		echo -e "$COLOR_BROWN git $COLOR_NC initialization failed"
	fi
	echo -e "Creating repository on$COLOR_GRAY github $COLOR_NC"
	python3 ~/init42/srcs/create_repo.py
elif [ $(git remote -v | grep "origin" | wc -l) -eq 0 ]
then
	echo -e "Creating repository on$COLOR_GRAY github $COLOR_NC"
	python3 ~/init42/srcs/create_repo.py
elif [ $(git remote -v | grep "github" | wc -l) -eq 0 ]
then
	echo -e "Creating repository on$COLOR_GRAY github $COLOR_NC"
	python3 ~/init42/srcs/create_repo.py
fi

GITIGNORE_BOILER_PLATE="# Gitignore
.gitignore

# VSCode
.vscode

# Objects
objs

# Exec file
$(cat Makefile | grep "NAME		=" | awk '{printf $3}')"

if [ $GITIGNORE -eq 0 ]
then
	echo -e "$GITIGNORE_BOILER_PLATE" > ".gitignore"
	if [ $(ls -la | grep ".gitignore" | wc -l) -gt 0 ]
	then
		echo -e "$COLOR_BROWN .gitignore $COLOR_NC created"
	else
		echo -e "$COLOR_BROWN .gitignore $COLOR_NC creation failed"
	fi
fi
