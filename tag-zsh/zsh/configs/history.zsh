setopt hist_ignore_all_dups inc_append_history hist_reduce_blanks extended_history
HISTFILE=~/.zsh_history
HISTSIZE=1000000000000000000
SAVEHIST=$HISTSIZE

export ERL_AFLAGS="-kernel shell_history enabled"
