#!/bin/bash

LIBFT=$(if [ $(ls -la | grep "libft" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

function add_libft()
{
	git clone https://github.com/LSV310/AG42-Libft.git libft
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
		echo "Libft not replaced"
	fi
fi
