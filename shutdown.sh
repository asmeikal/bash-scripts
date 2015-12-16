#!/bin/bash

IGNORED_FILES="/home/michele/Developer/Bash/.shutdown_ignore"
DIR=`pwd`

ifs_newline() {
	IFS=$'\n'
}

ifs_old() {
	IFS=$OLD_IFS
}

OLD_IFS=$IFS
ifs_newline
for d in `find ~ -name ".git" 2>/dev/null`; do
	cd "$d/.."
	CURR_DIR=`pwd`
	if grep -Fxq "$CURR_DIR" $IGNORED_FILES ; then
		continue
	fi
	echo $CURR_DIR
	git status -sb
	echo
	ifs_old
	while [ 0 ] ; do
		echo -n "> "
		read cmd args
		case $cmd in
			continue|c)
				break
			;;
			quit|q)
				exit 1
			;;
			*)
				command $cmd $args
			;;
		esac
	done
	ifs_newline
	echo
done

