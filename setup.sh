#!/bin/zsh

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
# Install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm "$HOME/.zshrc"

# Install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

stow bash
stow bin
stow config
stow emacs
stow git
stow shell
stow tmux
stow vim
stow zsh

if [[ `uname` == 'Darwin' ]]; then
    curl -fLo "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package" --create-dirs https://packagecontrol.io/Package%20Control.sublime-package
    mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
    link "$HOME/shell/sublime/Packages/User/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
    link "$HOME/shell/sublime/Packages/User/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"
else
    stow i3
    stow conky
    stow compton
    stow termite
fi


git config --global core.excludesfile ~/.gitignore_global

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
