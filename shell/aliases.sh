#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/shell/aliases.sh

# ----------------------------------------------------------------------
# some handy ls defaults
alias lsd="ls -daG */"
alias lsa="ls -laFG"
alias l="ls -FG"

# alias ls="ls -FG"
# because i'm switching back & forth between this and old DOS & CP/M systems
alias dir=ls

# 'how' replaces my old 'where' from ms-dos
alias how="type -a"
