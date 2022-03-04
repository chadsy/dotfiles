#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/java/java_profile.sh

# ----------------------------------------------------------------------
# java crap
export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
