# -----------------------------------------------------------------------------
# Variables d'environements
# -----------------------------------------------------------------------------
export HISTSIZE=1000
export HISTFILESIZE=2000

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

# username@hostname => %B%F{blue}%n%b@%B%m%b:
PROMPT="%B%F{blue}%~%f${vcs_info_msg_0_}%f"$'\n'"%F{green}λ%F{250} "
RPROMPT=''

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%B%F{green} git(%F{255}%b%B%F{green})%f'
zstyle ':vcs_info:*' enable git

# -----------------------------------------------------------------------------
# Alias basiques
# -----------------------------------------------------------------------------
alias ll="ls -l"
alias lh="ls -lh"
alias la="ls -a"
alias lla="ls -la"

alias buildc="bash ~/builder_lang.sh c clang"
alias buildcpp="bash ~/builder_lang.sh cpp clang++"

# -----------------------------------------------------------------------------
# Alias pour Git
# -----------------------------------------------------------------------------
alias ginit="git init"
alias gclone="git clone"
alias gadd="git add ."
alias gcommit="git commit -a"
alias gstatus="git status"
alias gpush="git push"

