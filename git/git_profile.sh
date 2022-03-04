#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/git/git_profile.sh

alias git_pull_all="ls -daG */ | xargs -I % sh -c 'cd %; echo ------------ syncing %; git fetch; git pull; cd ..'"

alias gs="git status -bs"
alias gp="git fetch; git pull"
alias gco="git fetch; git checkout"
alias gsl="git sl"

# ----------------------------------------------------------------------
# git completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# echo Installing Bash Completion

# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
#     # if not found in /usr/local/etc, try the brew --prefix location
#     [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
#         . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
# }

# source ~/Dropbox/mactools/git-flow-completion.bash
