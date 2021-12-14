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

# Arguments
# $1 : name of the language
# $2 : name of the compiler

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
c_lang="$1"
c_compiler="$2"
c_flags=$(ask "compiler flags" "-Wall -Wextra -Werror")
sources_folder=$(ask "sources folder" "./sources")
includes_folder=$(ask "includes folder" "./includes")
bin_folder="bin"

title	"!" "Installation..."

progress_size	5
progress_step	1	"Creation du projet c++ $project_name"
mkdir	$project_name >> /dev/null
cd		$project_name >> /dev/null

progress_step	2	"Creation du .gitignore"
touch	.gitignore >> /dev/null
echo	-e	"*.DS_Store\n*.out\n*.o\n\n$project_name\n\n$bin_folder/" >> .gitignore

progress_step	3	"Creation du Makefile"
touch	Makefile >> /dev/null
echo	-e	"NAME\t\t\t:=\t$project_name\n" >> Makefile
echo	-e	"SOURCES\t\t\t:=\t$sources_folder" >> Makefile
echo	-e	"INCLUDES\t\t:=\t$includes_folder" >> Makefile
echo	-e	"OBJECTS\t\t\t:=\t$bin_folder\n" >> Makefile
echo	-e	"SRCS\t\t\t:=\tmain.$c_lang\n" >> Makefile
echo	-e	"OBJS\t\t\t:=\t\$(addprefix \${OBJECTS}/, \$(SRCS:.$c_lang=.o))\n" >> Makefile
echo	-e	"CC\t\t\t\t:=\t$c_compiler" >> Makefile
echo	-e	"CFLAGS\t\t\t:=\t$c_flags" >> Makefile
echo	-e	"CINCLUDES\t\t:=\t-I \${INCLUDES}\n" >> Makefile
echo	-e	"GREEN\t\t\t:=\t\"\\\033[1;32m\"" >> Makefile
echo	-e	"BLUE\t\t\t:=\t\"\\\033[1;36m\"" >> Makefile
echo	-e	"EOC\t\t\t\t:=\t\"\\\033[0m\"\n" >> Makefile
echo	-e	"\${OBJECTS}/%.o: \${SOURCES}/%.$c_lang" >> Makefile
echo	-e	"\t@mkdir -p \$(dir \$@)" >> Makefile
echo	-e	"\t@echo \"● Compilation de \"\${BLUE}\"\${notdir $<}\"\${EOC}\".\""	>> Makefile
echo	-e	"\t@\${CC} \${CFLAGS} -o \$@ -c \$< \${CINCLUDES}\n" >> Makefile
echo	-e	"all: \${NAME}\n" >> Makefile
echo	-e	"\${NAME}: \${OBJS}" >> Makefile
echo	-e	"\t@echo \$(GREEN)\"● Compilation de \${NAME}...\"\$(EOC)" >> Makefile
echo	-e	"\t@\${CC} \${CFLAGS} -o \${NAME} \${OBJS}\n" >> Makefile
echo	-e	"clean:" >> Makefile
echo	-e	"\t@echo \$(GREEN)\"● Suppression des fichiers binaires (.o)...\"\$(EOC)" >> Makefile
echo	-e	"\t@rm -rf \${OBJECTS}\n" >> Makefile
echo	-e	"fclean: clean" >> Makefile
echo	-e	"\t@echo \${GREEN}\"● Supression des executables et librairies...\"\$(EOC)" >> Makefile
echo	-e	"\t@rm -f \${NAME}\n" >> Makefile
echo	-e	"re: fclean all\n" >> Makefile
echo	-e	".PHONY: all clean fclean re" >> Makefile

progress_step	4	"Creation des dossiers $sources_folder et $includes_folder"
mkdir	$sources_folder	$includes_folder >> /dev/null

progress_step	5	"Creation du main.$c_lang"
touch	$sources_folder/main.$c_lang >> /dev/null
echo	-e	"#include <iostream>\n" >> $sources_folder/main.$c_lang
echo	-e	"int main(void)" >> $sources_folder/main.$c_lang
echo	-e	"{" >> $sources_folder/main.$c_lang
echo	-e	"\tstd::cout << \"Hello World!\" << std::endl;" >> $sources_folder/main.$c_lang
echo	-e	"\treturn (0);" >> $sources_folder/main.$c_lang
echo	-e	"}\n" >> $sources_folder/main.$c_lang

progress_end

rm -rf	$project_name
