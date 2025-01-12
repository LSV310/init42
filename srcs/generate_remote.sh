#!/bin/bash

REMOTE_ORIGIN=$(if [ $(git remote -v | grep "origin" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
REMOTE_42=$(if [ $(git remote -v | grep "vogsphere" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

if [ $REMOTE_42 -eq 1 ]
then
	if [ ! -z "$1" ]
	then
		git remote add github $1
	fi
elif [ $REMOTE_ORIGIN -eq 0 ]
then
	if [ ! -z "$1" ]
	then
		git remote add origin $1
		git add .
		git commit -m "Initial Commit"
		git push --set-upstream origin master
	fi
fi
