/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/11 13:26:23 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 12:31:42 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "init42.h"

int	exec_cmd(char *cmd, char *arg, char **ep)
{
	char	*args[3] = {cmd, arg, NULL};
	pid_t	pid;

	pid = fork();
	if (pid == -1)
		ft_putstr_fd("fork error", 2);
	else if (pid == 0)
	{
		if (execve(cmd, args, ep) == -1)
			(perror("execve"), exit(EXIT_FAILURE));
	}
	wait(NULL);
}
