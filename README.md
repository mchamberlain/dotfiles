dotfiles
========

My customised user configuration files. This repository includes a number of
submodules containing vim and Sublime Text 2 plugins and themes. See the .vim
and .config/sublime-text-# directories.

To compile the Clang plugin for the YouCompleteMe vim plugin run:

    $ ./build_plugins.sh
    
You must have a recent version of CMake and preferably the latest (3.3+)
version of LLVM/Clang installed on your system for this to work.

There is also an install script that creates symlinks in your home directory to
most of the configuration files in this repository. If a file with the same
name already exists in your home directory, a warning is printed and nothing is
done to that file. Missing parent directories in your home directory are
created. To run the install script:

    $ ./install.sh

