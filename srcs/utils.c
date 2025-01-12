/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agruet <agruet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/11 13:26:23 by agruet            #+#    #+#             */
/*   Updated: 2025/01/12 23:27:14 by agruet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "init42.h"

int exec_cmd(char *cmd, char *arg, char **ep)
{
    char *args[3] = {cmd, arg, NULL};
    pid_t pid;
    char *home;

    // Expansion de ~ en $HOME
    if (cmd[0] == '~') {
        home = getenv("HOME");
        if (home) {
            char new_cmd[1024];
            snprintf(new_cmd, sizeof(new_cmd), "%s%s", home, cmd + 1);
            cmd = new_cmd;
        } else {
            perror("HOME not set");
            return -1;
        }
    }

    // Vérification de l'existence du fichier et expansion du chemin
    char resolved_path[1024];
    if (realpath(cmd, resolved_path) == NULL) {
        perror("realpath error");
        return -1;
    }

    pid = fork();
    if (pid == -1) {
        perror("fork error");
        return -1;
    }
    else if (pid == 0) {
        // Exécution de la commande
        if (execve(resolved_path, args, ep) == -1) {
            perror("execve");
            exit(EXIT_FAILURE);
        }
    }

    wait(NULL);
    return 0;
}
