#/bin/sh

DOT_ROOT=$HOME/Repos/dotfiles

ln -s $DOT_ROOT/zshenv $HOME/.zshenv
zcompile ~/.zshenv

ln -s $DOT_ROOT/zshrc $HOME/.zshrc
zcompile ~/.zshrc

ln -s $DOT_ROOT/zlogin $HOME/.zlogin
zcompile ~/.zlogin

ln -s $DOT_ROOT/zlogout $HOME/.zlogout
zcompile ~/.zlogout

ln -s $DOT_ROOT/zprofile $HOME/.zprofile
zcompile ~/.zprofile

ln -s $DOT_ROOT/tmux.conf $HOME/.tmux.conf
ln -s $DOT_ROOT/vimrc $HOME/.vimrc
