export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Fafacxdxbxegedabagacad

# PROMPT STUFF
GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
RESET=$(tput sgr0);

# history size
HISTSIZE=5000
HISTFILESIZE=10000


export PATH=/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir:/usr/local/bin:/usr/share/www/devops/scripts:$PATH;

#PATH ALTERATIONS
## Node
export PATH="/usr/local/bin:$PATH:./node_modules/.bin";

# CDPATH ALTERATIONS
export CDPATH=.:$HOME:$HOME/code:$HOME/Desktop

# general shortcuts
alias locate="mdfind -name $1"
alias mv='mv -i'
alias rm='rm -i'
# listing files
alias l='ls -al'
alias ltr='ls -ltr'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'

# editing shortcuts
alias m='mate'
alias c='code .'


# Custom Aliases
alias c="code .";
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias sb="source ~/.bash_profile";
alias sz="source ~/.zshrc";
alias de="cd ~/Desktop";
alias d="cd ~/code";
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u";

## git aliases
function gc { git commit -m "$@"; }
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules && npm i && say NPM is done";
alias nicache="npm install --prefer-offline";
alias nioff="npm install --offline";
## use hub for git
alias git=hub

# Custom functions
mg () { mkdir "$@" && cd "$@" || exit; }

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# Thanks to Geoffrey's peepcode for many of these
alias g='git '
alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'

# For when you are stuck between worlds...
alias gsd='git svn dcommit'
alias gsr='git svn rebase'


# top level folder shortcuts
alias www='cd /usr/share/www'
alias www:bi='cd /usr/share/www/base_includes'
alias www:int='cd /usr/share/www/intranet.directstartv.com'
alias www:h='cd /usr/share/www/hailo'

alias h?="history | grep "

# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'


# COLOR STRINGS
        RED="\[\033[0;31m\]"
     ORANGE="\[\033[0;33m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[0;34m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

function gitprompt () {
	local gitbranch=$(git branch 2>&1 | grep '\*' | sed -e 's/\* //g')
	if [[ "$gitbranch" != "" ]]; then
      PS1="${BLUE}\h${WHITE} [\u] ${LIGHT_GRAY}\w${YELLOW} (${gitbranch}) ${LIGHT_GRAY}: "
    else
      PS1="${BLUE}\h${WHITE} [\u] ${LIGHT_GRAY}\w${YELLOW} ${LIGHT_GRAY}: "
    fi
}
PROMPT_COMMAND=gitprompt


SSH_KNOWN_HOSTS=( $(cat ~/.ssh/known_hosts | \
  cut -f 1 -d ' ' | \
  sed -e s/,.*//g | \
  uniq | \
  egrep -v [0123456789]) )
SSH_CONFIG_HOSTS=( $(cat ~/.ssh/config | grep "Host " | grep -v "*" | cut -f 2 -d ' ') )

complete -o default -W "${SSH_KNOWN_HOSTS[*]} ${SSH_CONFIG_HOSTS[*]}" ssh

WHOAMI=$(whoami)
export PATH=/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir:/usr/local/bin:/usr/share/www/devops/scripts:$PATH
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:{$WHOAMI}/lib/node_modules"
export NODE_ENV=development


if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export NVM_DIR="/Users/brcox/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias py='python3'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
