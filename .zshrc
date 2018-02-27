# common stuff

source ~/.aliases
export EDITOR="vim"
ulimit -c unlimited
export MAILCHECK=0
export GIT_SSL_NO_VERIFY="true"
umask 022




# oh-my-zsh stuff

if [ -e $HOME/.oh-my-zsh ]; then

  ZSH=$HOME/.oh-my-zsh
	ZSH_THEME="awesomepanda"
	#CASE_SENSITIVE="true"
	#DISABLE_LS_COLORS="true"
	#DISABLE_AUTO_TITLE="true"
	#COMPLETION_WAITING_DOTS="true"
	plugins=(git brew gem heroku osx pip python terminalapp sublime dircycle)
	source $ZSH/oh-my-zsh.sh

fi

PROMPT=%m\ $PROMPT


# CS LINUX ONLY
#
if [ `uname` = "Linux" ]; then
	export PATH=$PATH:~/bin:/usr/java/jdk:/bin:/usr/bin:/usr/ucb:/usr/sbin:/sbin:/usr/bsd:/usr/java/latest/bin:/usr/java/jdk:/usr/bin/X11:/usr/X11R6/bin:/usr/local/bin:/usr/local/bin/X11:/usr/contrib/bin:/usr/pbs/bin:.

	function setenv () { export $1="$2"; }
	export WWW_HOME="http://www.cs.dartmouth.edu/~tim/"
	export DOMAIN="cs.dartmouth.edu"
	export PAGER=less
	export PRINTER=s014hp

fi


#OSX ONLY
if [[ `pwd` == *Users/tim* ]];then

	export PATH=/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/Users/tim/.cabal/bin:/Users/tim/bin:/usr/local/opt/ruby/bin:$PATH
	export PATH=$PATH:/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin
	export NODE_PATH=/usr/local/share/npm/lib/node_modules

	fpath=(/usr/local/share/zsh-completions $fpath)
	# . `brew --prefix`/etc/profile.d/z.sh

	# Initialization for FDK command line tools.Sun Oct  7 12:47:26 2012
	FDK_EXE="/Users/tim/bin/FDK/Tools/osx"
	PATH=${PATH}:"/Users/tim/bin/FDK/Tools/osx"
	export PATH
	export FDK_EXE

	#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/Applications/Unity/MonoDevelop.app/Contents/Frameworks/Mono.framework/Versions/2.10.2/lib/pkgconfig

# teach shell to treat aliases like symbolic links rather than files
#cd () {
#	emulate -L zsh
#	if [[ $# -eq 0 ]]; then
#		builtin cd
#	elif [[ -d "${1}" || -L "${1}" ]]; then	# regular link or directory
#		builtin cd "${1}"
#	elif [ -f "${1}" ]; then	# file: is it an alias?
#		# Redirect stderr to dev null to suppress OSA environment errors
#		exec 6>&2 # Link file descriptor 6 with stderr so we can restore stderr later
#  	exec 2>/dev/null # stderr replaced by /dev/null
#		thepath=$(osascript << EOF
#tell application "Finder"
#set theItem to (POSIX file "${1}") as alias
#if the kind of theItem is "alias" then
#get the posix path of ((original item of theItem) as text)
#end if
#end tell
#EOF
#)
#	#	exec 2>&6 6>&-      # Restore stderr and close file descriptor #6.
#
#		if [[ "$thepath" == '' ]];then # probably not an alias, but regular file
#			builtin cd "${1}"	# will trigger regular shell error about cd to regular file
#		else	# is alias, so use the returned path of the alias
#			builtin cd "$thepath"
#		fi
#	else	# should never get here, but just in case.
#		builtin cd "${1}"
#	fi
#}

brew_reinstall () {
				brew list > ~/brewlist
				brew uninstall --force $(brew list)
				brew install $(cat ~/brewlist)
}
brew_relink () {
				brew unlink $(brew list)
				brew link $(brew list)
}

fi


[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules


alias flask="python -m flask"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"


code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


alias cs52surge="surge /Users/tim/Dropbox/Development/cs52/dartmouth-cs52.github.io.development/_site cs52-dev.surge.sh"

eval "$(thefuck --alias)"

eval "$(rbenv init -)"

export PATH="$HOME/.fastlane/bin:$PATH"
