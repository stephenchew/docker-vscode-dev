# OS common
alias l='ls -l --color=auto'
alias ll='ls -al --color=auto'

# Git
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gsw='git switch'
alias gsm='git switch master'
alias gsml='git switch master && git pull'
alias gsc='git switch -c'
alias gscf='git switch -C'
alias gs='git status'
alias gb='git branch -v'
alias gl='git pull'
alias gp='git push'
alias gpom='git push -u origin master'
alias gf='git fetch'
alias gfpa='git fetch --prune --all'
alias gfm='git fetch origin master:master'
alias glog='git log --pretty=oneline --graph'
alias gdlocal="git branch -v | grep '\[gone\]' | awk '{print \$1}' | xargs git branch -D"
alias gr1="git reset HEAD~1"
alias gbi="git rebase -i"
alias gsync="gsml && gfpa && gdlocal"
