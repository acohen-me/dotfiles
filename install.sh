#!/usr/bin/env bash

DOTS=~/'Docs/.dotfiles'
CDOTS="$DOTS/.commondots"

ln -si "$CDOTS"/.bashrc ~
ln -si "$CDOTS"/.bash_profile ~
ln -si "$CDOTS"/.tmux.conf ~
ln -si "$CDOTS"/.gitconfig ~
ln -si "$CDOTS"/vim/rcs/default.vimrc ~/.vimrc
ln -si "$CDOTS"/vim/ ~/.vim
