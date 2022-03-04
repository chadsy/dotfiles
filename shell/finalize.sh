#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/shell/finalize.sh

unset -f _trace_it
unset -f _add_breadcrumb
unset DEBUG_BASH
