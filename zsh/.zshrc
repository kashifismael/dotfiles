# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%F{48}(%b%u%c)%f'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{48}(%b|%a💥)%f'
zstyle ':vcs_info:git*' unstagedstr '⚡️'
zstyle ':vcs_info:git*' stagedstr '🧩'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

export PROMPT='%n@%m %1~${vcs_info_msg_0_} %# '

export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# general aliases
alias ..="cd .."

# vim
alias nvconf="cd ~/.config/nvim && nvim init.lua"
alias viconf="vi ~/.vimrc"
alias nv="nvim"

alias py="python3"

# use ripgrep for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!{**/node_modules/*,**/.git/*,**/build/*,**/.gradle/*,**/.idea/*}'"
alias rgrep="rg -i --glob '!{**/node_modules/*,**/.git/*}'"
export KUBECTX_IGNORE_FZF=1

ff() {
	cd ~/IdeaProjects && cd `ls | fzf`
}

nvff() {
	nv `fzf`
}

viff() {
  vim `fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'`
}

#mongo
#alias run-local-mongo="mongod --config /opt/homebrew/etc/mongod.conf"

#git
alias ga='git add'
alias gd='git diff --color | less -R'
alias gds='git diff --staged --color | less -R'
alias gr='git restore'
alias grs='git restore --staged'
alias gcob='git checkout -b'
alias gb='git branch'
alias gst='git status'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gpra='git pull --rebase --autostash'
alias gpr='git pull --rebase'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph --color | less -R'
alias gc='git commit'
alias gcskip='git commit --no-verify'
alias gcm='git checkout main'
alias gp='git push'
alias gpf!='git push --force'
gco() {
  local branch
  branch=$(git branch -a | fzf | sed "s/.* //")

  if [[ "$branch" = "" ]]; then
    echo "No branch selected."
    return
  fi

  echo $branch

  if [[ "$branch" = 'remotes/'* ]]; then
    git checkout --track $branch
  else
    git checkout $branch;
  fi
}
gbd() {
  local branch
  branch=$(git branch | fzf | sed "s/.* //")

  if read -q "choice?Press Y/y to delete branch: "; then
      echo "\n"
      git branch -d $branch
  else
      echo
      echo "'$choice' not 'Y' or 'y'. Exiting..."
  fi
}

grbi() {
  local branch_data
  branch_data=$(git log --oneline | fzf --reverse)
  echo "Interactive rebase on $branch_data"
  local branch_hash=$(echo $branch_data | awk '{ print $1 }')
  git rebase --interactive $branch_hash
}

#k8s
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgj='kubectl get jobs'
alias kdp='kubectl describe pod'
alias klf='kubectl logs -f'
alias kpf="kubectl port-forward"
alias keti='kubectl exec -t -i'

# gradle/spring boot
alias run-spring='./gradlew bootRun | ecslog -i message,error'
alias debug-spring='./gradlew bootRun --debug-jvm | ecslog -i message,error'

# docker
deti() {
  CONTAINER_DATA=$(docker container ls | fzf)
  CONTAINER_ID=$(echo $CONTAINER_DATA | awk '{ print $1 }')
  docker exec -it $CONTAINER_ID sh
}
dkc() {
  CONTAINER_DATA=$(docker container ls | fzf)
  CONTAINER_ID=$(echo $CONTAINER_DATA | awk '{ print $1 }')
  docker kill container $CONTAINER_ID
}
alias dcu="docker-compose up -d"
