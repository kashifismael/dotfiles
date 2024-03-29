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

export KUBE_PS1_CTX_COLOR="cyan"
export KUBE_PS1_SYMBOL_ENABLE=false
source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"

export PROMPT='%~${vcs_info_msg_0_} $(kube_ps1) $ '

export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagaced'
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# general aliases
alias ..="cd .."
alias la="ls -a"
alias make-exec="chmod +x"
alias repos="cd ~/repos"

# vim
alias nvconf="cd ~/.config/nvim && nvim init.lua"
alias viconf="vi ~/.vimrc"
alias nv="nvim"

alias py="python3"
alias run-server="py -m http.server"

# use ripgrep for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!{**/node_modules/*,**/.git/*,**/build/*,**/.gradle/*,**/.idea/*}'"
alias rgrep="rg -i --glob '!{**/node_modules/*,**/.git/*}'"
export KUBECTX_IGNORE_FZF=1

ff() {
	cd ~/IdeaProjects && cd `ls | fzf`
}

nvff() {
  nvim `fzf --preview 'cat {}'`
}

#git
alias gaa='git add --all'
ga() {
  local git_file=$(git status -s | fzf)
  local file_path=$(echo $git_file | awk '{print $2}')
  git add $file_path
}
gd() {
  git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --color=always {+2}' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap
}
gds() {
  git status -s \
 | fzf --no-sort --reverse \
 --preview 'git diff --staged --color=always {+2}' \
 --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up \
 --preview-window=right:60%:wrap
}
alias gr='git restore'
grp() {
  local git_file=$(git status -s | fzf)
  local file_path=$(echo $git_file | awk '{print $2}')
  git restore $file_path -p
}
alias grs='git restore --staged'
alias gcob='git checkout -b'
alias gb='git branch'
alias grpo='git remote prune origin'
alias gst='git status'
alias grb='git rebase'
alias grbm='git rebase main'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias gpra='git pull --rebase --autostash'
alias gpr='git pull --rebase'
alias gf='git fetch'
glog() {
  git log -n 20 --oneline --decorate | fzf --reverse --multi --preview 'git show --color=always {+1}'
}
alias gc='git commit --no-verify'
alias gca='git commit --no-verify --all'
alias gcm='git checkout main'
alias gp='git push --no-verify'
alias gpf!='git push --force'
gco() {
  local branch=$(git branch -a | fzf | sed "s/.* //")

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
  local branch=$(git branch | fzf | sed "s/.* //")

  if read -q "choice?Press Y/y to delete branch: "; then
      echo "\n"
      git branch -d $branch
  else
      echo
      echo "'$choice' not 'Y' or 'y'. Exiting..."
  fi
}

grbi() {
  local branch_data=$(git log --oneline | fzf --reverse)
  echo "Interactive rebase on $branch_data"
  local branch_hash=$(echo $branch_data | awk '{ print $1 }')
  git rebase --interactive $branch_hash
}

grff() {
  git restore `git diff --name-only | fzf`
}

grsff() {
  git restore --staged `git diff --staged --name-only | fzf`
}

#k8s
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgj='kubectl get jobs'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias klf='kubectl logs -f'
kdpff() {
  local pod_id=$(kubectl get pods | fzf | awk '{ print $1 }')
  kubectl describe pod | bat -lyaml
}
klfp() {
  local pod_id=$(kubectl get pods | fzf | awk '{ print $1 }')
  kubectl logs -f --since=10m $pod_id
}
klf-ecs() {
  local pod_id=$(kubectl get pods | fzf | awk '{ print $1 }')
  kubectl logs -f --since=10m $pod_id | ecslog -i message,error
}
#alias kpf="kubectl port-forward"
kpf() {
  local service_to_pf=$(kubectl get services | fzf | awk '{ print $1 }')
  kubectl port-forward service/$service_to_pf 8080:80
}
keti() {
  local pod_id=$(kubectl get pods | fzf | awk '{ print $1 }')
  kubectl exec -t -i $pod_id sh
}
kapply() {
	local manifest_file=$(fd 'yml|yaml' | fzf)
	kubectl apply -f $manifest_file
}

# gradle/spring boot
alias gradle-build='./gradlew clean build'
alias run-spring='./gradlew bootRun | ecslog -i message,error'
alias debug-spring='./gradlew bootRun --debug-jvm | ecslog -i message,error'

# docker
deti() {
  local container_data=$(docker container ls | fzf)
  local container_id=$(echo $container_data | awk '{ print $1 }')
  docker exec -it $container_id sh
}
dsc() {
  local container_data=$(docker container ls | fzf)
  local container_id=$(echo $container_data | awk '{ print $1 }')
  docker stop container $container_id
}
drmc() {
  local container_data=$(docker container ls --all | fzf)
  container_id=$(echo $container_data | awk '{ print $1 }')
  docker container rm $container_id
}
alias dcu="docker-compose up -d"
alias dcls="docker container ls --all"

# node
alias nrd="npm run dev"
alias nvm20="nvm use 20"
alias nuke-npm="rm -rf node_modules"

#ts
alias tscheck="npx tsc --project tsconfig.json"

# jest
jeff() {
 npx jest `fd test | fzf`
}

# vitest
vtff() {
 npx vitest `fd test | fzf`
}
alias vt="npx vitest"

#bat
alias yaml_pp="bat -lyaml"
alias json_pp="bat -ljson"

#miscellaeous
alias far="~/repos/find-and-replace/findandreplace"
