#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/shell/bash_profile.sh

PATH=/usr/local/opt/ruby/bin:$PATH:~/Dropbox/mactools

# ----------------------------------------------------------------------
# some unix epoch date help
alias unepoch="date -r"
alias datecode="date -j '+%Y%m%d'"

function epochit() {
    date -j -f "%Y-%m-%d %H:%M:%S" "$1 00:00:00" "+%s"
}

function lsln() {
    ls -alFG $1 | grep '^[l]'
}

function create_uuid() {
    uuid=$(uuidgen)
    echo $uuid | pbcopy && pbpaste
}

# ----------------------------------------------------------------------
# My configs and profile stuff
safe_source ~/.shell_private.sh
safe_source $DOTFILES_HOME/git/git_profile.sh
safe_source $DOTFILES_HOME/java/java_profile.sh
safe_source $DOTFILES_HOME/shell/aliases.sh
safe_source $DOTFILES_HOME/shell/prompt.sh
