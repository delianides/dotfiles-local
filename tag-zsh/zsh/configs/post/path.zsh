# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:$PATH"
export GOPATH="$HOME/Code/go"
export GOBIN="$HOME/Code/go/bin"

# Try loading ASDF from the regular home dir location
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
elif which brew >/dev/null &&
  BREW_DIR="$(dirname `which brew`)/.." &&
  [ -f "$BREW_DIR/opt/asdf/asdf.sh" ]; then
  . "$BREW_DIR/opt/asdf/asdf.sh"
  . "$HOME/.asdf/plugins/java/set-java-home.zsh"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:/usr/local/opt/libpq/bin:$PATH"

export -U PATH
