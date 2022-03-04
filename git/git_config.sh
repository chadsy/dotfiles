#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/git/git_config.sh

# git log formatting; slog is pretty & multi-line; sl is pretty & single-line
git config --global alias.slog "log --graph --date=short --pretty=format:'%C(bold red)%h%Creset %C(bold magenta)%d %Creset %ae %C(bold yellow)%cd%Creset%n    %C(bold cyan)%s%Creset%n    %C(yellow)%cr: %ci%Creset%n'"
git config --global alias.sl "log --graph --date=short --pretty=format:'%C(bold red)%h%Creset %C(bold magenta)%d %Creset %ae %C(bold yellow)%cd%Creset    %C(bold cyan)%s%Creset'"
git config --global alias.smartlog "!git sl"
git config --global alias.stat "!git status"

# git config --global alias.top "cd $(!git rev-parse --top-level)"
# gotop = "!f() { cd $(git rev-parse --show-toplevel) }; f"

# make git commands quieter about hints and shit
git config --global advice.statusHints false
git config --global advice.commitBeforeMerge false
git config --global advice.detachedHead false
git config --global advice.resolveConflict false
