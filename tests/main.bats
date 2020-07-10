#!/usr/bin/env bats

@test "vim install" {
  run vim --version
  [ "$status" -eq 0 ]
}

@test "tmux install" {
  run tmux -V
  [ "$status" -eq 0 ]
}

@test "git install" {
  run git --version
  [ "$status" -eq 0 ]
}

@test "fd install" {
  run fd --version
  [ "$status" -eq 0 ]
}

@test "neovim install" {
  run nvim --version
  [ "$status" -eq 0 ]
}

@test "ripgrep install" {
  run rg --version 
  [ "$status" -eq 0 ]
}

@test "silver surfer install" {
  run ag --version
  [ "$status" -eq 0 ]
}

@test "docker install" {
  run docker --version
  [ "$status" -eq 0 ]
}

@test  "fzf install" {
  run fzf --version
  [ "$status" -eq 0 ]
}

@test "asdf install" {
  run asdf --version
  [ "$status" -eq 0 ]
}

@test "node install" {
  run node --version
  [ "$status" -eq 0 ]
  [[ "$output" =~ ^v[0-9]+\.[0-9]+\.[0-9]+ ]]
}

@test "golang install" {
  run go version
  [ "$status" -eq 0 ]
  [[ "$output" =~ ^.*[0-9]+\.[0-9]+\.[0-9]+.*$ ]]
}

@test "rust install" {
  run cargo --version
  [ "$status" -eq 0 ]
  [[ "$output" =~ ^.*[0-9]+\.[0-9]+\.[0-9]+.*$ ]]
}


