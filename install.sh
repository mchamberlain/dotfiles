#!/bin/bash

# Copyright (c) 2013 Morné Chamberlain
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

function link() {
    src="$1"
    target="$2"
    if [ -e "$target" ]; then
        if [ ! -L "$target" ]; then
            echo "WARNING: $target exists but is not a symlink."
        fi
    else
        parent_dir=`dirname "$target"`
        if [ ! -e "$parent_dir" ]; then
            mkdir -p "$parent_dir"
        fi
        echo "Creating $target"
        ln -s "$src" "$target"
    fi
}

pushd `dirname "$BASH_SOURCE"` > /dev/null

link "$PWD/.oh-my-zsh" "$HOME/.oh-my-zsh"
link "$PWD/.zshrc" "$HOME/.zshrc"
link "$PWD/.vimrc" "$HOME/.vimrc"
link "$PWD/.gitconfig" "$HOME/.gitconfig"
link "$PWD/.gitmessage" "$HOME/.gitmessage"
link "$PWD/issue" "$HOME/issue"

link "$PWD/bin/hs" "$HOME/bin/hs"

mkdir -p "$HOME/.themes"
link "$PWD/.themes/Numix" "$HOME/.themes/Numix"

mkdir -p "$HOME/.icons"
link "$PWD/.icons/Numix-uTouch" "$HOME/.icons/Numix-uTouch"

mkdir -p "$HOME/.vim"
link "$PWD/.vim/autoload" "$HOME/.vim/autoload"
link "$PWD/.vim/bundle" "$HOME/.vim/bundle"
link "$PWD/.vim/colors" "$HOME/.vim/colors"
link "$PWD/.vim/ftplugin" "$HOME/.vim/ftplugin"

for f in `find "$PWD/.config/plank" -type f -printf "%P\n"`; do
    link "$PWD/.config/plank/$f" "$HOME/.config/plank/$f"
done

mkdir -p "$HOME/.config/sublime-text-2/Packages/User"
link "$PWD/.config/sublime-text-2/Packages/User/Preferences.sublime-settings" "$HOME/.config/sublime-text-2/Packages/User/Preferences.sublime-settings"
link "$PWD/.config/sublime-text-2/Packages/User/Package Control.sublime-settings" "$HOME/.config/sublime-text-2/Packages/User/Package Control.sublime-settings"
link "$PWD/.config/sublime-text-2/Packages/tomorrow-theme" "$HOME/.config/sublime-text-2/Packages/tomorrow-theme"
link "$PWD/.config/sublime-text-2/Packages/Theme - Soda" "$HOME/.config/sublime-text-2/Packages/Theme - Soda"

mkdir -p "$HOME/.config/sublime-text-3/Packages/User"
link "$PWD/.config/sublime-text-3/Packages/User/Preferences.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
link "$PWD/.config/sublime-text-3/Packages/User/Package Control.sublime-settings" "$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
link "$PWD/.config/sublime-text-3/Packages/tomorrow-theme" "$HOME/.config/sublime-text-3/Packages/tomorrow-theme"
link "$PWD/.config/sublime-text-3/Packages/Theme - Soda" "$HOME/.config/sublime-text-3/Packages/Theme - Soda"

link "$PWD/.config/terminator/config" "$HOME/.config/terminator/config"

link "$PWD/.config/tint2/tint2rc" "$HOME/.config/tint2/tint2rc"

popd > /dev/null

unset -f link
