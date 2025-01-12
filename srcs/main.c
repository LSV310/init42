/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/10 22:34:01 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 21:43:02 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "init42.h"

void	parssing_tree(char *arg, char **ep)
{
	if (arg[0] && arg[0] == '-')
	{
		if (arg[1] && arg[1] == '-')
		{
			if (!ft_strcmp(arg + 2, "libft") || !ft_strcmp(arg + 2, "lft"))
				exec_cmd("~/init42/srcs/libft.sh", NULL, ep);
			else if (!ft_strcmp(arg + 2, "git"))
				exec_cmd("~/init42/srcs/git.sh", NULL, ep);
			else
				ft_fprintf(2, "Argument not found\n");
			return ;
		}
		else if (arg[1])
		{
			if (ft_strchr(arg + 1, 'l'))
				exec_cmd("~/init42/srcs/libft.sh", NULL, ep);
			if (ft_strchr(arg + 1, 'g'))
				exec_cmd("~/init42/srcs/git.sh", NULL, ep);
			else
				ft_fprintf(2, "Argument not found\n");
			return ;
		}
	}
}

int	main(int ac, char **av, char **ep)
{
	int	i;

	i = 1;
	exec_cmd("~/init42/srcs/init42.sh", NULL, ep);
	while (i < ac)
	{
		parssing_tree(av[i], ep);
		i++;
	}
	return (0);
}
