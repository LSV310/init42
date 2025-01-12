/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/10 22:34:01 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 14:15:23 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "init42.h"

void	parssing_tree(char *arg, char **ep)
{
	if (!ft_strcmp(arg, "libft") || !ft_strcmp(arg, "lft"))
		exec_cmd("/home/agruet/dev/init42/srcs/libft.sh", NULL, ep);
	else if (!ft_strcmp(arg, "git"))
		exec_cmd("/home/agruet/dev/init42/srcs/git.sh", NULL, ep);
	else
		ft_fprintf(2, "Argument not found\n");
}

int	main(int ac, char **av, char **ep)
{
	int	i;

	i = 1;
	exec_cmd("/home/agruet/dev/init42/srcs/init42.sh", NULL, ep);
	while (i < ac)
		parssing_tree(av[i++], ep);
	return (0);
}
