/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   override_libft.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/11 10:55:16 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 21:43:06 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "init42.h"

int	main(int ac, char **av, char **ep)
{
	(void)ac;
	(void)av;
	ft_fprintf(0, "Libft is already installed, do you want to override it? [Y,n] ");
	char *gnl = get_next_line(0);
	while (gnl)
	{
		if (ft_strncmp(gnl, "Y\n", 2) == 0)
		{
			exec_cmd("~/init42/srcs/libft.sh", "confirm", ep);
			free(gnl);
			gnl = NULL;
		}
		else if (ft_strncmp(gnl, "n\n", 2) == 0)
		{
			exec_cmd("~/init42/srcs/libft.sh", "cancel", ep);
			free(gnl);
			gnl = NULL;
		}
		else
		{
			free(gnl);
			ft_fprintf(0, "Libft is already installed, do you want to override it? [Y,n] ");
			gnl = get_next_line(0);
		}
	}
}
