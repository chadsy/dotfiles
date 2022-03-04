#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/shell/aliases.sh

# ----------------------------------------------------------------------
# some handy ls defaults
alias lsd="ls -daG */"
alias lsa="ls -laFG"
alias l="ls -FG"
alias lsf="ls -alFG | grep '^[-l]'"
# alias ls="ls -FG"
# because i'm switching back & forth between this and old DOS & CP/M systems
alias dir=ls

###

# ----------------------------------------------------------------------
# docker stuff?
# alias todock="cd ~/docker-local"
# alias dock="docker-compose up -d "
# alias undock="docker-compose down"
