#!/usr/bin/env bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    show_space.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.f>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/03 18:17:30 by acoezard          #+#    #+#              #
#    Updated: 2022/02/03 18:17:30 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'

# Avoid boring prefix in du/df/etc
cd "$HOME"

initial_used_space=$(df -h "$HOME" | grep -v 'Filesystem' | awk '{ printf("%f", $3) }')

# Show current used space
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$")
echo -e "${blue}Current space:\n${reset}${initial_df}${reset}"
echo -e "${blue}\nHome folder:${reset}"
du -hd1 . 2>/dev/null | sort -h | grep --color=always "[0-9]*\.*[0-9]*M\t\|[0-9]*\.*[0-9]*G\t\|$"
echo ""
