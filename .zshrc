# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# history size
export HISTSIZE=5000
export HISTFILESIZE=10000

#PATH ALTERATIONS
## Node
export PATH=/usr/local/bin:$PATH:./node_modules/.bin:/Library/Java/apache-maven-3.5.2/bin;

# CDPATH ALTERATIONS
export CDPATH=.:$HOME:$HOME/dev:$HOME/Desktop

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="dracula"
DRACULA_DISPLAY_TIME=1
DRACULA_DISPLAY_CONTEXT=1

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-autosuggestions npm osx zsh-syntax-highlighting docker docker-compose
)

#################################################
# tab - Open the current directory in a new tab
# ofd - Open the current directory in a Finder window
# pfd - Return the path of the frontmost Finder window
# pfs - Return the current Finder selection
# cdf - cd to the current Finder directory
# pushdf - pushd to the current Finder directory
# quick-look - Quick-Look a specified file
# man-preview - Open a specified man page in Preview app
# showfiles - Show hidden files
# hidefiles - Hide the hidden files
# itunes - Control iTunes. User itunes -h for usage details
# spotify - Control Spotify and search by artist, album, track and etc.
#################################################


source $ZSH/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

############################################
# Aliases                                  #
############################################
alias c="code .";
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias sb="source ~/.bash_profile";
alias sz="source ~/.zshrc";
alias dev="cd ~/dev";
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u";
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias week='date +%V'
alias py='python3'
# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"
# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
## git aliases
# use hub for git
alias git=hub
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gundo="git reset --soft HEAD~1"
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
# random
alias soundhound="spotify play uri spotify:user:bc0x:playlist:19e8F6hIso2ZwkifBaHJt8"
alias shuffle="spotify toggle shuffle"

############################################
# Functions                                #
############################################
# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}
function gc {
  git commit -m "$@";
}
function new-svelte(){
  npx degit sveltejs/template "$1"
  cd "$1"
  npm i
  c
}
function new-sapper(){
  npx degit sveltejs/sapper-template#rollup "$1"
  cd "$1"
  npm i
  c
}

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home"
export JAVA_OPTS="-Xmx1024m -Dsun.lang.ClassLoader.allowArraySyntax=true"
export MAVEN_OPTS="-Xmx2048m -XX:ReservedCodeCacheSize=128m -Dsun.lang.ClassLoader.allowArraySyntax=true"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brandon.cox/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/brandon.cox/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brandon.cox/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/brandon.cox/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/brandon.cox/dev/internal/slalom-seating-backend/node_modules/tabtab/.completions/slss.zsh
