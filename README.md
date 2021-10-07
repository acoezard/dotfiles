# dotfiles

Tout ce dont j'ai besoin pour faire d'Ubuntu/MacOS un workspace agréable après une nouvelle installation.

[![forthebadge](https://forthebadge.com/images/badges/ctrl-c-ctrl-v.svg)](https://forthebadge.com)

## Mon environement

|             |                                                      |           |
| :---------- | :--------------------------------------------------- | --------- |
| **Os**      | [Ubuntu](https://ubuntu.com/download)                | `v20.04 ` |
| **Shell**   | [Zsh](https://www.zsh.org/)                          | `v5.8`    |
| **Tool**    | [Git](https://git-scm.com/)                          | `v2.25.1` |
| **Ide**     | [Vim](https://www.vim.org/)                          | `v8.0`    |

## Installation

Pour préparer le nouvel OS, et nettoyer la racine des anciens fichiers de configuration,
il faut executer la commande suivante:

```make
	make
```

Sinon, pour seulement nettoyer la racine des anciens fichiers de configuration:

```make
	make clean
```

Enfin, pour seulement copier les nouveaux fichiers de configuration à la racine:

```make
	make copy
```
