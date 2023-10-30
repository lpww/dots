
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export EDITOR=vim

#initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#subl aliases
alias subl="subl3"

#bash aliases
alias bashrc="subl ~/.bashrc"
alias rebashrc=". ~/.bashrc"
alias bashprofile="subl ~/.bash_profile"
alias rebashprofile=". ~/.bash_profile"

#git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout'
alias gp='git pull'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gl='git log'
alias gr='git reflog'
alias gf='git fetch'
#cleanup local branches fully merged into master
alias gcl="git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d"

#npm aliases
alias ni='rm package-lock.json; npm i; rm package-lock.json'
alias nre='rm -rf node_modules && ni'
alias nt='npm test'
alias nr='npm run'
alias nv='npm version'
alias nli='npm link'
alias nuli='npm unlink'
alias nls='( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l'
alias nu='npm update'
alias ns='npm start'
#list globally installed packages
alias ng='npm list -g --depth=apply'

#docker aliases
alias dcp='docker container prune'
alias dsp='docker system prune'
alias dvp='docker volume prune'

#wave aliases
alias rt='sudo docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 rethinkdb'
alias es='sudo docker run -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" elasticsearch'

#drive-google
alias drive='drive-google'

#weather
function wttr(){
  LOCATION=${1}
  curl 'http://wttr.in/\~'$LOCATION
}

#add scripts at ~/bin to path
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
