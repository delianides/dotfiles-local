#!/bin/bash
# vim: tw=0
# from https://github.com/gabebw/dotfiles/blob/main/install.sh

set -eo pipefail

color() {
  local colornumber="$1"
  shift
  tput -T xterm setaf "$colornumber"
  echo "$*"
  tput -T xterm sgr0
}

# blue = 4
# magenta = 5
red(){ color 1 "$*"; }
green(){ color 2 "$*"; }
yellow(){ color 3 "$*"; }

info(){
  green "=== $*"
}

error(){
  red "!! $*"
}

stay_awake_while(){
  if [ "$CI" = "true" ] ; then
    yellow "CI MODE: $*"
  else
    case "$OSTYPE" in
    darwin*)  caffeinate -dims "$@" ;;
    linux*)   "$@" ;;
    *)        echo "unknown: $OSTYPE" ;;
    esac
  fi
}

command_does_not_exist(){
  if [ "$CI" = "true" ] ; then
    yellow "CI MODE: $1"
  else
    command -v "$1" > /dev/null & exit 1
  fi
}

quietly_brew_bundle(){
  local brewfile=$1
  shift
  local regex='(^Using|Installing|Skipping )|error|failed'
  if [ "$CI" = "true" ] ; then
    stay_awake_while brew bundle list --file="$brewfile" "$@"
  else
    stay_awake_while brew bundle --no-lock --file="$brewfile" "$@" | (grep -Ei "$regex" || true)
  fi
}
