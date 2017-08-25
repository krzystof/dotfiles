#!/usr/bin/env zsh

# https://github.com/nicknisi/dotfiles/blob/master/bin/tm

# abort if we're already inside a TMUX session
if [ ! -z ${TMUX} ]; then
    echo "Am not using that inside a TMUX session"
    exit 0
fi


# startup a "default" session if non currently exists
# tmux has-session -t _default || tmux new-session -s _default -d

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S" 2>/dev/null) "New Session" "zsh")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
	case $opt in
		"New Session")
			read -p "Enter new session name: " SESSION_NAME
			tmux new -s "$SESSION_NAME"
			break
			;;
		"zsh")
			zsh --login
			break;;
		*)
			tmux attach-session -t $opt
			break
			;;
	esac
done
