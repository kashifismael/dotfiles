export PROMPT='%F{magenta}%~%f $ '
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
alias gst='git status --short --branch'
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
