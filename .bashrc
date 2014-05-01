# set command line editing mode to vi
set -o vi

# set a fancy prompt
export PS1="% "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export NODE_PATH=/usr/local/share/npm/lib/node_modules

export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
shopt -s histappend
# Combine multiline commands into one in history                                                                                                                                                         
shopt -s cmdhist

export ADT_ROOT=${HOME}/dev/adt/
export NDK_ROOT=${HOME}/dev/ndk/

PATH=/usr/local/bin:$PATH
PATH=$PATH:/opt/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:${HOME}/bin
PATH=$PATH:${HOME}/bin/dex2jar-0.0.9.13/
PATH=$PATH:/usr/local/share/npm/bin
PATH=$PATH:${HOME}/dev/adt/sdk/tools
PATH=$PATH:${ADT_ROOT}/sdk/tools/
PATH=$PATH:${ADT_ROOT}/sdk/platform-tools
PATH=$PATH:${NDK_ROOT}/
PATH=$PATH:${HOME}/dev/maven/bin
PATH=$PATH:${HOME}/bin/valgrind/bin
PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p374/bin/ #cocoapods
PATH=$PATH:/usr/local/Cellar/ack/1.96/bin/
PATH=$PATH:${HOME}/dev/adt/eclipse/plugins/org.apache.ant_1.8.3.v20120321-1730/bin/



###################
#     Aliases     #
###################

# set a fancy ls coloring thing
#export LS_OPTIONS='--color=auto'
alias ll='ls -lh'
alias la='ls -Alh'
alias lh='ls -lt | head'

alias ce="source /Users/dshirley/Environments/crittercism/bin/activate"

alias cdenv="cd ~/Environments/crittercism"
alias cdjbc="cd ${HOME}/src/android/libcore/luni/src/main/java"
alias cdjba="cd ${HOME}/src/android/external/apache-http/src/org/apache/http"

alias sc="ce; cd ~/Environments/crittercism/crittercism/server; paster serve ${HOME}/dev/development.ini;"
alias start_crash_task="ce; cd ~/Environments/crittercism/crittercism/server; python amqp/amqp_runner.py -q crash_task"
alias start_ndk_task="ce; cd ~/Environments/crittercism/crittercism/server; python amqp/amqp_runner.py -q ndk_symbolication"
alias ndk-build-debug="ndk-build NDK_DEBUG=true"
alias f="find . | grep -i"

alias rmswp="find . | grep -e "\.sw[mnop]$" | xargs rm"

# Git Aliases
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gcom="git commit -m "
alias gch="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gh="git help"
alias gl="git log"
alias gs="git status"
alias gstl="git stash list"
alias gst="git stash"
alias gstp="git stash pop"
alias glistconflicts="git diff --name-only --diff-filter=U"

# CD Aliases
alias cdu="cd ../; pwd;"
alias cdu1="cd ../; pwd;"
alias cdu2="cd ../../; pwd;"
alias cdu3="cd ../../../; pwd;"
alias cdu4="cd ../../../..; pwd;"
alias cdu5="cd ../../../../..; pwd;"
alias cdios="cd ${HOME}/src/crittercism-ios"
alias cdroid="cd ${HOME}/src/crittercism-android"
alias cdsrv="cd ${HOME}/Environments/crittercism/crittercism/server/crittercism"

alias myip="ifconfig | grep 192 | awk '{print $2}'"
alias chef="ssh lechef.crittercism.com"

alias redshift='psql --user dshirley -h proddatawarehouse.cz09u6wkel0g.us-west-2.redshift.amazonaws.com -p 5439 -d crittercismwarehouse'

function jdisasm() {
  find $1 | grep -e "\.class" | sed -e "s/\.class//g" -e "s/\//./g"  | xargs -n 1 javap -c
}

function cdr() {
	while [ ! -d .git ]; do
		cd ..
	done

	echo "Changed to root directory: `pwd`"
}


function psit() {
	ps -A | grep $1 | grep -v "grep"
}

function tochef() {
  scp "${1}" lechef.crittercism.com:~
}

function fromchef() {
  scp lechef.crittercism.com:~/"${1}" .
}

function mountAndroid {
  hdiutil attach ~/dev/android.dmg.sparseimage -mountpoint /${HOME}/src/android;
}


##
# Your previous /Users/dshirley/.bash_profile file was backed up as /Users/dshirley/.bash_profile.macports-saved_2014-04-21_at_17:39:06
##

# MacPorts Installer addition on 2014-04-21_at_17:39:06: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

