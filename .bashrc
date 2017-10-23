source ~/.aliases
export EDITOR="vim"
ulimit -c unlimited
export MAILCHECK=0
export GIT_SSL_NO_VERIFY="true"
export HISTSIZE="UNLIMITED"
umask 022
export CLICOLOR=1
export LSCOLORS='gxbxfxfxcxexexhbadbxbx'

export PS1="\n[\h:\W] \!) "

# CS LINUX ONLY
#
if [[ `pwd` == /net/nusers/tim* ]]; then
  export PATH=$PATH:~/bin:/usr/java/jdk:/bin:/usr/bin:/usr/ucb:/usr/sbin:/sbin:/usr/bsd:/usr/java/latest/bin:/usr/java/jdk:/usr/bin/X11:/usr/X11R6/bin:/usr/local/bin:/usr/local/bin/X11:/usr/contrib/bin:/usr/pbs/bin:.

  function setenv () { export $1="$2"; }
  export WWW_HOME="http://www.cs.dartmouth.edu/~tim/"
  export DOMAIN="cs.dartmouth.edu"
  export PAGER=less
  export PRINTER=s014hp

fi

#OSX ONLY
if [[ `pwd` == *Users/tim* ]];then

  export PATH=/usr/local/bin:/usr/local/sbin:/Users/tim/.cabal/bin:/Users/tim/bin:$PATH
  export PATH=$PATH:/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin/

	export NODE_PATH=/usr/local/share/npm/lib/node_modules
  source "`brew --prefix grc`/etc/grc.bashrc"

  fpath=(/usr/local/share/zsh-completions $fpath)
  # . `brew --prefix`/etc/profile.d/z.sh

  # Initialization for FDK command line tools.Sun Oct  7 12:47:26 2012
  FDK_EXE="/Users/tim/bin/FDK/Tools/osx"
  PATH=${PATH}:"/Users/tim/bin/FDK/Tools/osx"
  export PATH
  export FDK_EXE

  #export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/Applications/Unity/MonoDevelop.app/Contents/Frameworks/Mono.framework/Versions/2.10.2/lib/pkgconfig

	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi

	# teach shell to treat aliases like symbolic links rather than files
	function cd {
		if [ ${#1} == 0 ]; then
			builtin cd
		elif [[ -d "${1}" || -L "${1}" ]]; then	# regular link or directory
			builtin cd "${1}"
		elif [ -f "${1}" ]; then	# file: is it an alias?
			# Redirect stderr to dev null to suppress OSA environment errors
			exec 6>&2 # Link file descriptor 6 with stderr so we can restore stderr later
			exec 2>/dev/null # stderr replaced by /dev/null
			path=$(osascript << EOF
tell application "Finder"
set theItem to (POSIX file "${1}") as alias
if the kind of theItem is "alias" then
get the posix path of ((original item of theItem) as text)
end if
end tell
EOF
)
			exec 2>&6 6>&-      # Restore stderr and close file descriptor #6.
	
			if [ "$path" == '' ];then # probably not an alias, but regular file
				builtin cd "${1}"	# will trigger regular shell error about cd to regular file
			else	# is alias, so use the returned path of the alias
				builtin cd "$path"
			fi
		else	# should never get here, but just in case.
			builtin cd "${1}"
		fi
}


fi


export PG="PG: dbname=universe host=fairchild-020.kiewit.dartmouth.edu port=5432 user=geo_user password=geo_user"
