#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/install/macOS.sh

# Tell macOS to play the startup sound
sudo nvram StartupMute=%00

# Tell macOS to play the battery charge chime
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true

# Tell Xcode to show build duration in the header; NB is this still needed in 2022?
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

