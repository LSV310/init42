CC			= cc
CFLAGS		= -g3 #-Wall -Werror -Wextra

LIBFT_DIR	= libft
LIBFT		= $(LIBFT_DIR)/libft.a

INCLUDES	= includes/
SRC_DIR		= srcs/
OBJ_DIR		= objs/

CFLAGS		+= -I$(INCLUDES)

INIT_SRC	= main.c utils.c
INIT_OBJ	= $(patsubst %.c, $(OBJ_DIR)%.o, $(INIT_SRC))

OVERR_SRC	= override_libft.c utils.c
OVERR_OBJ	= $(patsubst %.c, $(OBJ_DIR)%.o, $(OVERR_SRC))

INIT_NAME	= init42
OVERR_NAME	= libft_override

all: $(INIT_NAME) $(OVERR_NAME)

$(INIT_NAME): $(LIBFT) $(INIT_OBJ)
	$(CC) $(CFLAGS) $(INIT_OBJ) $(LIBFT) -o $(INIT_NAME)

$(OVERR_NAME): $(LIBFT) $(OVERR_OBJ)
	$(CC) $(CFLAGS) $(OVERR_OBJ) $(LIBFT) -o $(OVERR_NAME)

$(LIBFT):
	make -sC $(LIBFT_DIR)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)
	@make clean -sC $(LIBFT_DIR)

fclean: clean
	rm -rf $(INIT_NAME) $(OVERR_NAME)
	make fclean -sC libft

re: fclean all

.PHONY: all clean fclean re
