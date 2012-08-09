# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

##
# Settings
##
HISTFILE=~/.sh_history
HISTSIZE=1000

# use most if available, else less
if [ -x /usr/local/bin/most ]; then
	export PAGER=most
else
	# Use colors for less, man, etc.
	# To compile mostlike.txt, do this
	# $ tic mostlike.txt
	# It will end up under ~/.terminfo/m/mostlike
	# Source: http://nion.modprobe.de/blog/archives/569-colored-manpages.html
	alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
fi
# fileutils
if [ -x /usr/local/bin/gls ]; then
	alias ls="/usr/local/bin/gls -F --color=auto"
fi
# colourful grep
if [ -x /usr/local/bin/ggrep ]; then
	alias grep="ggrep --colour=auto"
fi
# vim for the win
if [ -x /usr/local/bin/vim ]; then
	export EDITOR=vim
	export VISUAL=emacs
	alias rvim"=vim --servername vim --remote-tab"
fi

#set -o vi
#set +o emacs

