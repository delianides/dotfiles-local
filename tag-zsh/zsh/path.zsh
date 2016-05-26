# Golang
export GOPATH="$HOME/Projects/go"
export GOBIN="$HOME/Projects/go/bin"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Heroku standalone client
export PATH="/usr/local/heroku/bin:$PATH"

# Node
export PATH=$PATH:/usr/local/share/npm/bin

export PATH=$HOME/.bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin:$GOBIN" # Add RVM to PATH for scripting

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

