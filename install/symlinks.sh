#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/install/symlinks.sh

# ----------------------------------------------------------------------

# Bash profiles and related things
ln -sf $DOTFILES_HOME/shell/.inputrc ~/.inputrc
ln -sf $DOTFILES_HOME/shell/.bashrc ~/.bashrc
ln -sf $DOTFILES_HOME/shell/.bash_profile ~/.bash_profile
ln -sf $DOTFILES_HOME/shell/.iterm2_shell_integration.bash ~/.iterm2_shell_integration.bash

# ----------------------------------------------------------------------
# App configs that are located in ./apps

# Gargoyle interactive fiction interpreter
ln -sf ${DOTFILES_HOME}/apps/garglk.ini ~/garglk.ini

# DOSBOX ms-dos emulator
# NB: Notice the silly use of version in the filename :(
ln -sf ${DOTFILES_HOME}/apps/dosboxconfig ~/Library/Preferences/DOSBox\ 0.74-3-3\ Preferences

# ----------------------------------------------------------------------
# Various CLI app launchers & helpers

# sublime text editor link for command-line launching
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# TODO: harvest symlinks from /usr/local/bin and other locations to see what
# links and cruft have accumulated over time

# TODO: plistbuddy
# ln -s "/usr/libexec/plistbuddy" /usr/local/bin/plistbuddy
