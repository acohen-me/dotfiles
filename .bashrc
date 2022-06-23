#!/usr/bin/env bash

# Adam's .bashrc

###############################################################################
# Mac
###############################################################################
if [ "$(uname)" == 'Darwin' ]; then

export IGNOREEOF=1 # ignore & warn on first ^d;
#  `set -o ignoreeof` for other OS's but can't specify count
alias ls='ls -G' # colour output
alias sha256='openssl dgst -sha256'
shownames() {
	echo 'ComputerName:  ' "$(scutil --get ComputerName  2> /dev/null)"
	echo 'LocalHostName: ' "$(scutil --get LocalHostName 2> /dev/null)"
	echo 'HostName:      ' "$(scutil --get HostName      2> /dev/null)"
}
rebrew() {
	set -x
	brew update &&
	brew upgrade &&
	brew cleanup &&
	brew doctor
	set +x
}

###############################################################################
# Linux / Default
###############################################################################
else

alias sha256='sha256sum'
# TODO: colourized ls output
# TODO: alias open='xdg-open ...'

fi

###############################################################################
# Common
###############################################################################
set -o vi # vi key bindings for bash
export HOMEBREW_NO_ANALYTICS=1
export EDITOR='vim'
export GUI_EDITOR='atom'
PS1='\[\e[0;34m\]\u\[\e[0m\] \[\e[0;32m\]@\[\e[0m\] \[\e[0;36m\]\h\[\e[0m\] \[\e[0;35m\]\w\[\e[0m\] \$ '
DOTS=~/'Docs/.dotfiles'
CDOTS="$DOTS/.commondots"
LDOTS="$DOTS/.localdots"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# Do not allow basic path changes at run time
# shellcheck disable=SC2139
{
alias dots="cd $DOTS"
alias cdots="cd $CDOTS"
alias ldots="cd $LDOTS"
}

# core utils
alias l='ls -al'
alias la='ls -a'
alias lr='ls -alR'
alias c='clear'
alias cl='clear && ls -al'
alias o='open .' # TODO: only use . if nothing specified

# editing
# shellcheck disable=SC2139
{
alias e="$EDITOR"
alias g="$GUI_EDITOR"
alias wr="vim -u ~/.vim/rcs/writer.vimrc" # w is a util that already exists
}

# rc files
# shellcheck disable=SC2139
{
alias bashrc="$EDITOR $CDOTS/.bashrc"
alias tmuxrc="$EDITOR $CDOTS/.tmux.conf"
alias vimrc="$EDITOR $CDOTS/vim"
alias localrc="$EDITOR $LDOTS/.bashrc"
}

# git
alias gits='git status'
alias gitss='git status --short --branch --show-stash'
alias gitl='git log --pretty=oneline'
alias gitll='git log --pretty="%C(yellow)%H %C(reset)%an (%ae) %C(blue) %s%C(reset)"'
alias gitconfigs='git config --list --show-origin'
alias gitd='git diff'
alias gitds='git diff --staged'

# reload configs
alias reprofile='. ~/.bash_profile'
alias retmux='tmux source-file ~/.tmux.conf'
alias relocate='/usr/libexec/locate.updatedb' # TODO: make executable; verify on Linux

# docker
alias dockerdf='docker system df'
alias dockerstop='docker stop $(docker ps -aq)'
alias dockerrm='docker rm -f $(docker ps -aq)'
alias dockerrmi='docker rmi -f $(docker images -q)'
dockerclean() {
	dockerstop
	dockerrm
	dockerrmi
}

# misc
alias filetypes_here="find . -type f -name '*.*' | sed 's|.*\.||' | sort -u"
nohistory() {	# TODO: test on Linux
	rm ~/.bash_history
	history -c
	exit
}
shortcuts() {	# TODO: test on Linux
	printf '%s' "$(compgen -A alias -A function)" | sort | column
}

# include local rc settings
[ -f "$LDOTS"/.bashrc ] && . "$LDOTS"/.bashrc
