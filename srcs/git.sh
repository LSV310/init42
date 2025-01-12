#!/bin/bash

GIT=$(if [ $(ls -la | grep ".git" | awk '{printf $1}' | grep "d" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
GITIGNORE=$(if [ $(ls -la | grep ".gitignore" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

if [ $GIT -eq 0 ]
then
	git init > /dev/null
	python3 /home/agruet/dev/init42/srcs/create_repo.py
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
	echo "$GITIGNORE_BOILER_PLATE" > .gitignore
fi
