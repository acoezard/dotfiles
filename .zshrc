# -----------------------------------------------------------------------------
# Variables d'environements
# -----------------------------------------------------------------------------
export HISTSIZE=1000
export HISTFILESIZE=2000

export LANG=fr_FR.UTF8
export LC_ALL=fr_FR.UTF8

export USER="acoezard"
export MAIL="acoezard@student.42nice.fr"

export PATH=$PATH:/usr/local/go/bin

# -----------------------------------------------------------------------------
# Options basiques
# -----------------------------------------------------------------------------
setopt EXTENDED_HISTORY
setopt interactivecomments

# -----------------------------------------------------------------------------
# Options pour gerer l'apparence de Zsh
# -----------------------------------------------------------------------------
ZSH_THEME="TheOne"

PROMPT="%B%F{blue}%n%b@%B%m%b:%F{yellow}%~%f "

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}%f'
zstyle ':vcs_info:git:*' formats '%F{240}(%b) %B%F{green}%r'
zstyle ':vcs_info:*' enable git

# -----------------------------------------------------------------------------
# Alias basiques
# -----------------------------------------------------------------------------
alias ll="ls -l"
alias lh="ls -lh"
alias la="ls -a"
alias lla="ls -la"

# -----------------------------------------------------------------------------
# Alias pour Git
# -----------------------------------------------------------------------------
alias ginit="git init"
alias gadd="git add ."
alias gcommit="git commit -a"
alias gstatus="git status"
alias gpush="git push"

