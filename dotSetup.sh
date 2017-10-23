#!/bin/sh
#install dot files:

if [[ $# != 1 || ! -d $1 || ! "$1" = /* ]]; then
	echo "Usage: $0 fullpathtodotfiles"
  exit 1
fi

for each in `find $1 -maxdepth 1 -name .\* | grep -v DS_Store|grep -v "^.$"|grep -v ".gitignore$"|grep -v ".git$"`; do ln -F -s $each ~/; done
