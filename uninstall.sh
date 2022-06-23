#!/usr/bin/env bash

[ -L ~/.bashrc ] && rm -v ~/.bashrc
[ -L ~/.bash_profile ] && rm -v ~/.bash_profile
[ -L ~/.tmux.conf ] && rm -v ~/.tmux.conf
[ -L ~/.gitconfig ] && rm -v ~/.gitconfig
[ -L ~/.vimrc ] && rm -v ~/.vimrc
[ -L ~/.vim ] && rm -rfv ~/.vim
