#!/bin/bash

IGNORED_FILES="$HOME/Developer/Bash/.git_check_ignore"

ifs_newline() {
	IFS=$'\n'
}

ifs_old() {
	IFS=$OLD_IFS
}

DIR=$(pwd)

OLD_IFS=$IFS
ifs_newline
for d in `find ~ -regex ".*/\.git" 2>/dev/null`; do
	cd "$d/.."
	CURR_DIR=$(pwd)
	if grep -Fxq "$CURR_DIR" $IGNORED_FILES ; then
		continue
	fi
	echo "Checking ${CURR_DIR}"
	LOCAL=$(git rev-parse @)
	REMOTE=$(git rev-parse @{u})
	BASE=$(git merge-base @ @{u})
	STATUS=$(git status --porcelain | cut -c1-2 | uniq)
	if [ $LOCAL = $REMOTE ] ; then
		if [ -z "${STATUS}" ] ; then
			echo "${CURR_DIR}: everything up to date"
		else
			STATUS_STRING=""
			if [[ $STATUS == *"M"* ]] ; then
				STATUS_STRING="${STATUS_STRING}modified "
			fi
			if [[ $STATUS == *"??"* ]] ; then
				STATUS_STRING="${STATUS_STRING}untracked "
			fi
			echo "${CURR_DIR}: ${STATUS_STRING}"
		fi
	else
		if [ $LOCAL = $BASE ] ; then
			echo "${CURR_DIR}: need to pull"
		elif [ $REMOTE = $BASE ] ; then
			echo "${CURR_DIR}: need to push"
		else
			echo "${CURR_DIR}: diverged"
		fi
	fi
done
ifs_old

cd $DIR

