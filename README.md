dotfiles
========

These are my local additions to the
[thoughtbot](https://github.com/thoughtbot/dotfiles) system.

Installation
------------

- XCode/Command Line Tools
- [Oh-My-ZSH](http://ohmyz.sh/)
- [Homebrew](http://brew.sh)
    - Git
    - Python
    - Vim (7.4)
- [RVM](http://rvm.io/)
- [Powerline](https://github.com/Lokaltog/powerline)

Clone

```
$ git clone https://github.com/thoughtbot/dotfiles
$ git clone https://github.com/delianides/dotfiles-local

$ brew bundle dotfiles/Brewfile

$ rcup -d dotfiles -d dotfiles-local -x README.md -x LICENSE -x Brewfile
```

Usage
-----

Folders in your local dotfiles will get symlinked to your home directory while
directories that exist in both repos will get merged. You can overwrite files in
the thoughtbot/dotfiles repo by not including the `.local` extension to the
files in your local dotfiles repo. `rcm` will always look at the local files in
this case. 

Reposting usage instructions here:

- `rcup` is the main program. It is used to install and update dotfiles,
  with support for tags, host-specific files, and multiple source
  directories.
- `rcdn` is the opposite of `rcup`.
- `mkrc` is for introducing a dotfile into your dotfiles directory, with
  support for tags and multiple source directories.
- `lsrc` shows you all your dotfiles and where they would be symlinked
  to. It is used by `rcup` but is provided for your own use, too.

Issues
------

- There was an issue with running `pip`, the solution was found [here](https://github.com/Lokaltog/powerline/issues/552). This happened during the powerline install.


