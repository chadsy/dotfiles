#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/install/install.sh

safe_source "${DOTFILES_HOME}/git/git_config.sh"
safe_source "${DOTFILES_HOME}/install/symlinks.sh"
safe_source "${DOTFILES_HOME}/install/macOS.sh"
safe_source "${DOTFILES_HOME}/install/tools.sh"
