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

function lsf() {
    ls -alFG $1 | grep '^[-l]'
}

function create_uuid() {
    uuid=$(uuidgen)
    echo $uuid | pbcopy && pbpaste
}

function gccrun() {
    echo "Building $1.c into $1"
    gcc -w -o "$1" -lstdc++ -fcolor-diagnostics "$1".c && echo "Running $1" && ./"$1"

    # llvm-gcc -g -S -fverbose-asm code_golf_1.cpp -lstdc++ -o code_golf_1.asm
    # https://codeyarns.com/tech/2019-12-30-how-to-generate-assembly-code-using-gcc.html
}

function reset_title() {
    echo -ne "\033];${_iterm2_hostname-}\a"
}

# ----------------------------------------------------------------------
# useful shortcut for find that is case-insenstive and allows for a starting folder parameter

function where () {
    if [[ "$#" == 1 ]]; then
        folder="."
        findVal=$1
        folderName="current folder"
    elif [[ "$#" == 2 ]]; then
        folder=$1
        findVal=$2
        folderName=$folder
    else
        echo Finds files that match a filespec, recursing directories, with an optional starting directory.
        echo
        echo usage: where [directory] filespec
        return 1
    fi

    result=$(find "${folder}" -iname "${findVal}")

    if [[ "$result" == "" ]]; then
        echo Did not find ${findVal} in ${folderName}
        return 1
    else
        echo $result
        return 0
    fi
}


# ----------------------------------------------------------------------
# My configs and profile stuff
safe_source ~/.shell_private.sh
safe_source $DOTFILES_HOME/git/git_profile.sh
safe_source $DOTFILES_HOME/docker/docker_profile.sh
safe_source $DOTFILES_HOME/java/java_profile.sh
safe_source $DOTFILES_HOME/shell/aliases.sh
safe_source $DOTFILES_HOME/shell/prompt.sh
