alias tmux='TERM=xterm-256color tmux -2'

#if which tmux 2>&1 >/dev/null; then
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
	test -z "$TMUX" && (tmux attach || tmux new)
fi

