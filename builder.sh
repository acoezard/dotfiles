#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    builder.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acoezard <acoezard@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/08 20:52:00 by acoezard          #+#    #+#              #
#    Updated: 2021/12/08 20:52:00 by acoezard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------------------------------------------------
# Couleurs
# -----------------------------------------------------------------------------
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
yellow=$'\e[93m'
grey=$'\e[90m'
reset=$'\033[0;39m'

# -----------------------------------------------------------------------------
# Fonctions
# -----------------------------------------------------------------------------
function	title {	echo "${cyan}$1 ${reset}$2"; }

function	ask {
	read -p "${cyan}> $1 ${yellow}($2)${reset}: " input
	if [ -z "$input" ]; then
		input=$2
	fi
	echo $input
}

function	progress_size { progress_c=$1; }

function	progress_step {
	progress=$(bc <<<"((${1}-1)*100/(${progress_c}-1)*100)/100")
	echo -e "${grey}[${progress}%] ${cyan}$2${reset}"
	sleep .2
}

function	progress_end { echo -e "${cyan}! ${reset}Pause fini, retourne travailler!"; }

# -----------------------------------------------------------------------------
# Builder
# -----------------------------------------------------------------------------
title	"?" "Choose or leave as default:"
project_name=$(ask "project name" "main")
c_lang=$(ask "language" "c")
c_compiler=$([ "$c_lang" == "c" ] && echo "gcc" || echo "clang++")
c_flags=$(ask "compiler flags" "-Wall -Wextra -Werror")
sources_folder=$(ask "sources folder" "sources")
includes_folder=$(ask "includes folder" "includes")
bin_folder="bin"

title	"!" "Installation..."

progress_size	5
progress_step	1	"Creation du projet $project_name"
mkdir	$project_name
cd		$project_name
git		init > /dev/null

progress_step	2	"Creation du .gitignore"
touch	.gitignore
echo	-e	"*.DS_Store\n*.out\n*.o\n\n$project_name\n\n$bin_folder/" >> .gitignore

progress_step	3	"Creation du Makefile"
touch	Makefile
echo	-e	"NAME\t\t\t:=\t$project_name\n"	>> Makefile
echo	-e	"SOURCES\t\t\t:=\t./$sources_folder"	>> Makefile
echo	-e	"INCLUDES\t\t:=\t./$includes_folder"	>> Makefile
echo	-e	"OBJECTS\t\t\t:=\t./$bin_folder\n"	>> Makefile
echo	-e	"SRCS\t\t\t:=\t$project_name.$c_lang\n"	>> Makefile
echo	-e	"OBJS\t\t\t:=\t\$(addprefix \${OBJECTS}/, \$(SRCS:.$c_lang=.o))\n"	>> Makefile

progress_step	4	"Creation des dossiers $sources_folder et $includes_folder"
mkdir	$sources_folder	$includes_folder

progress_step	5	"Creation du main.$c_lang"

progress_end

rm -rf	$project_name
