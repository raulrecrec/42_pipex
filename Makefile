# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rexposit <rexposit@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/08 14:29:05 by rexposit          #+#    #+#              #
#    Updated: 2025/01/15 18:32:49 by rexposit         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PROG	= pipex

SRCS 	= pipex.c utils.c
OBJS 	= ${SRCS:.c=.o}
MAIN	= pipex.c

CC 		= gcc
CFLAGS 	= -Wall -Wextra -Werror -g

.c.o:
			@gcc ${CFLAGS} -c $< -o $@

all: 		${PROG}

${PROG}:	${OBJS}
					@echo "\033[33m----Compiling lib----"
					@make re -C ./libft
					@$(CC) ${OBJS} -Llibft -lft -o ${PROG}
					@echo "\nPipex Compiled!\n"

clean:
					@make clean -C ./libft
					@rm -f ${OBJS}

fclean: 	clean
					@make fclean -C ./libft
					@rm -f $(NAME)
					@rm -f ${PROG}
					@echo "\nDeleting EVERYTHING!\n"

re:			fclean all

.PHONY: all clean fclean re re_bonus bonus party