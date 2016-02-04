dotfiles
========

I've merged some of the settings from [thoughtbot](https://github.com/thoughtbot/dotfiles) system into this repo.

Installation
------------

**In this order...**

- XCode/Command Line Tools
- [Homebrew](http://brew.sh)
    - Git
    - Python
    - Vim (7.4)
- [RVM](http://rvm.io/)
- [Powerline](https://github.com/Lokaltog/powerline)

Clone

```
$ git clone https://github.com/delianides/dotfiles

$ brew bundle dotfiles/Brewfile

$ rcup -d dotfiles -d -x README.md -x LICENSE -x Brewfile
```

Usage
-----

Reposting usage instructions here:

- `rcup` is the main program. It is used to install and update dotfiles,
  with support for tags, host-specific files, and multiple source
  directories.
- `rcdn` is the opposite of `rcup`.
- `mkrc` is for introducing a dotfile into your dotfiles directory, with
  support for tags and multiple source directories.
- `lsrc` shows you all your dotfiles and where they would be symlinked
  to. It is used by `rcup` but is provided for your own use, too.


Other Commands
---------------
`defaults write com.apple.screencapture location ~`
