dotfiles
========

My customised user configuration files. This repository includes a number of
submodules containing vim and Sublime Text 3 plugins and themes. See the .vim
and .config/sublime-text-# directories.

There is an install script that creates symlinks in your home directory to
most of the configuration files in this repository. If a file with the same
name already exists in your home directory, a warning is printed and nothing is
done to that file. Missing parent directories in your home directory are
created. To run the install script:

    $ ./install.sh

Influences
==========

Some of the files and settings were influenced by (taken from) the following
repos:

* https://github.com/mbrochh/vim-as-a-python-ide
* https://github.com/thoughtbot/dotfiles
