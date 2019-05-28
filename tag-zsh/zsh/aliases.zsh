###########
# ALIASES #
###########

# alias vim="nvim"
alias qq="cd . && source ~/.zshrc"
alias ls="ls -FGh"
alias du="du -cksh"
alias df="df -h"
# Use modern regexps for sed, i.e. "(one|two)", not "\(one\|two\)"
alias sed="sed -E"
alias rm="trash"

alias aci="asciinema"

alias re-source="source ~/.localrc"

alias ctags="`brew --prefix`/bin/ctags"

alias tmux="tmux -2"
alias vim="nvim"

alias ssh='TERM=xterm-256color ssh'

# spotify
alias sp="spotify pause"

# Use modern regexps for grep, and do show color when `grep` is the final
# command, but don't when piping to something else, because the added color
# codes will mess up the expected input.
alias grep="egrep --color=auto"

# Copy-pasting `$ python something.py` works
alias \$=''
alias diff="colordiff -u"
alias mkdir="mkdir -p"

# Needs to be a function because `alias -` breaks
function -() { cd - }

# Global aliases
alias -g G="| grep "
alias -g ONE="| awk '{ print \$1}'"

# Psh, "no nodename or servname not provided". I'll do `whois
# http://google.com/hello` if I want.
function whois() {
	command whois $(echo "$1" | sed -E -e 's|^https?://||' -e 's|/.*$||g')
}

function al { ls -t | head -n ${1:-10}; }

function cd () {
	if   [[ "x$*" == "x..." ]]; then
		cd ../..
			elif [[ "x$*" == "x...." ]]; then
			cd ../../..
			elif [[ "x$*" == "x....." ]]; then
			cd ../../../..
			elif [[ "x$*" == "x......" ]]; then
			cd ../../../../..
			elif [ -d ~/.autoenv ]; then
			source ~/.autoenv/activate.sh
			autoenv_cd "$@"
	else
		builtin cd "$@"
			fi
}

# If piping something in, copy it.
# If just doing `clip`, paste it.
function clip { [ -t 0 ] && pbpaste || pbcopy;}

function archive () {
  zip ${1}.zip ${1}
  mv ${1}.zip ~/Dropbox\ \(Personal\)/@Graveyard/
  rm -rf ${1}
}
# place this after nvm initialization!


