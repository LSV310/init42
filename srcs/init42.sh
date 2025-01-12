#!/bin/bash

MAKEFILE=$(if [ $(ls -la | grep "Makefile" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
SRCS=$(if [ $(ls -la | grep "srcs" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)
INCLUDES=$(if [ $(ls -la | grep "includes" | wc -l) -gt 0 ]; then echo 1; else echo 0; fi)

MAKEFILE_BOILER_PLATE="CC			= cc
CFLAGS		= -g3 #-Wall -Werror -Wextra

LIBFT_DIR	= libft
LIBFT		= \$(LIBFT_DIR)/libft.a

INCLUDES	= includes/
SRC_DIR		= srcs/
OBJ_DIR		= objs/

CFLAGS		+= -I\$(INCLUDES)

SRC			= main.c
OBJ			= \$(patsubst %.c, \$(OBJ_DIR)%.o, \$(SRC))

NAME		= $(basename $PWD)

all: \$(NAME)

# bonus: \$(BONUS_NAME)

\$(NAME): \$(LIBFT) \$(OBJ)
	\$(CC) \$(CFLAGS) \$(OBJ) \$(LIBFT) -o \$(NAME)

# \$(BONUS_NAME): \$(LIBFT) \$(BONUS_OBJ)
# 	\$(CC) \$(CFLAGS) \$(BONUS_OBJ) \$(LIBFT) -o \$(BONUS_NAME)

\$(LIBFT):
	make -sC \$(LIBFT_DIR)

\$(OBJ_DIR)%.o: \$(SRC_DIR)%.c
	@mkdir -p \$(OBJ_DIR)
	\$(CC) \$(CFLAGS) -c \$< -o \$@

clean:
	rm -rf \$(OBJ_DIR)
	@make clean -sC \$(LIBFT_DIR)

fclean: clean
	rm -rf \$(NAME)
#	rm -rf \$(NAME) \$(BONUS_NAME)
	make fclean -sC libft

re: fclean all

.PHONY: all bonus clean fclean re"

if [ $MAKEFILE -eq 0 ]
then
	echo -e "$MAKEFILE_BOILER_PLATE" > Makefile
fi

if [ $SRCS -eq 0 ]
then
	mkdir srcs
fi

if [ $INCLUDES -eq 0 ]
then
	mkdir includes
fi

NAME=$(grep "NAME		=" Makefile | awk '{print $3}')

INCLUDES_BOILER_PLATE="/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init42.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/10 23:03:39 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 10:30:13 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef ${NAME^^}_H
# define ${NAME^^}_H

# include \"libft.h\"



#endif"

if [ $(ls includes/ -I libft.h | wc -l) -eq 0 ]
then
	echo "$INCLUDES_BOILER_PLATE" > includes/$NAME.h
fi
