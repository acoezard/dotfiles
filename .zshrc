# -----------------------------------------------------------------------------
# Variables d'environements
# -----------------------------------------------------------------------------
export HISTSIZE=1000
export HISTFILESIZE=2000

export USER="acoezard"
export MAIL="acoezard@student.42nice.fr"

export EDITOR=vi
export GIT_EDITOR=vim

# -----------------------------------------------------------------------------
# Options basiques
# -----------------------------------------------------------------------------
setopt EXTENDED_HISTORY
setopt interactivecomments
set -o vi

# -----------------------------------------------------------------------------
# Options pour gerer l'apparence de Zsh
# -----------------------------------------------------------------------------

git_branch() {
  local branch
  local changes=""
  local modified_count

  # Récupérer la branche actuelle
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

  # Compter le nombre de fichiers modifiés (staged et unstaged)
  modified_count=$(git status --short 2>/dev/null | wc -l | tr -d ' ')

  # Si des modifications existent, ajoute "+n" au prompt
  if [[ $modified_count -gt 0 ]]; then
    changes="%F{yellow}+${modified_count}%f"
  fi

  # Afficher le prompt avec la branche et le nombre de fichiers modifiés
  if [[ -n "$branch" ]]; then
    echo "%F{green}git(%F{255}$branch%F{green})%f$changes"
  fi
}

setopt prompt_subst

PROMPT='%F{blue}%~%f $(git_branch)'$'\n''%F{green}λ%F{reset_color} '
RPROMPT=''


