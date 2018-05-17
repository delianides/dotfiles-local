function start-local() {
	# start from current directoy
	local directory=$(pwd)
	if [[ -z $(which tmux) ]]; then
		echo 'TMUX is not running!'
		return
	else
		if ! _tmux_session_exists 'local'; then
			tmux new-session -d -s 'local' -n 'code' -c "$directory"
			tmux select-window -t 'code'
			# tmux split-window -h -p 40
			# tmux select-pane -t 2
			# tmux split-window -v -p 25
			# tmux select-pane -t 1
		fi

		tmux attach-session -d -t 'local'
	fi
}

function stop-local() {
	if _tmux_session_exists 'local'; then
		tmux kill-session -t 'local'
	fi
}

function restart-local() {
	stop-local
	start-local
}

_tmux_session_exists(){
	local session_name="$1"
	sessions=$(tmux list-sessions | awk -F ':' '{print $1}')
	echo $sessions | grep -q "$session_name"
}
