Vim
===

## `ftdetect`

Any files in `~/.vim/ftdetect/` will also be run every time you start Vim.

ftdetect stands for "filetype detection". The files in this directory should set up autocommands that detect and set the filetype of files, and nothing else. This means they should never be more than one or two lines long.

## `ftplugin`

Files in `~/.vim/ftplugin/` are different.

The naming of these files matters! When Vim sets a buffer's filetype to a value it then looks for a file in `~/.vim/ftplugin/` that matches. For example: if you run set `filetype=derp` Vim will look for `~/.vim/ftplugin/derp.vim`. If that file exists, it will run it.

Vim also supports directories inside `~/.vim/ftplugin/`. To continue our example: set `filetype=derp` will also make Vim run any and all \*.vim files inside `~/.vim/ftplugin/derp/`. This lets you split up your plugin's ftplugin files into logical groups.

Because these files are run every time a buffer's filetype is set they must only set buffer-local options! If they set options globally they would overwrite them for all open buffers!

[Source](http://learnvimscriptthehardway.stevelosh.com/chapters/42.html)
