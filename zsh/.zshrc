# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '(%b)%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '⚡️'
zstyle ':vcs_info:git*' stagedstr '❇️ ' 
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

export PROMPT='%F{magenta}%~%f${vcs_info_msg_0_} $ '

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
	cd `ls | fzf`
}

nvff() {
	nv `fzf`
}

viff() {
	vim `fzf`
}

#mongo
alias run-local-mongo="mongod --config /opt/homebrew/etc/mongod.conf"

#git
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gst='git status'
alias gpr='git pull --rebase'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gc='git commit'
alias gcskip='git commit --no-verify'

#k8s
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgj='kubectl get jobs'
alias klf='kubectl logs -f'
alias kpf="kubectl port-forward"
alias keti='kubectl exec -t -i'
