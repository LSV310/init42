/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init42.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/10 23:03:39 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 12:30:24 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef INIT42_H
# define INIT42_H

# include "libft.h"
# include <stdio.h>
# include <fcntl.h>
# include <sys/wait.h>

int		exec_cmd(char *cmd, char *arg, char **ep);

#endif
