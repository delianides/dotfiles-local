#!/bin/bash

source ./lib/common.sh

info "Checking for caffeinate..."
if command_does_not_exist caffeinate; then
  case "$OSTYPE" in
    darwin*)  brew install caffeine ;;
    linux*)   sudo apt-get install caffeine -y ;;
    *)        echo "unknown: $OSTYPE" ;;
  esac
fi

info "Checking for command-line tools..."
if command_does_not_exist xcodebuild; then
  if [ "$OSTYPE" = "darwin*" ] ; then
    stay_awake_while xcode-select --install
  else
    yellow "=== Not MacOS not installing xcode-cli-tools"
  fi
fi

info "Installing Homebrew (if not already installed)..."
if command_does_not_exist brew; then
  echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

info "Installing Homebrew packages..."
brew tap homebrew/bundle
quietly_brew_bundle "./Brewfile" --verbose

if ! echo "$SHELL" | grep -Fq zsh; then
  info "Your shell is not Zsh. Changing it to Zsh..."
  chsh -s /bin/zsh
fi

info "Linking dotfiles into ~..."
# Before `rcup` runs, there is no ~/.rcrc, so we must tell `rcup` where to look.
# We need the rcrc because it tells `rcup` to ignore thousands of useless Vim
# backup files that slow it down significantly.
export RCRC=rcrc
stay_awake_while rcup -f -d .

green "=== Success!"

yellow "=== Post-install instructions ==="
yellow "1. Remap Caps Lock to Escape in the Keyboard prefpane"
