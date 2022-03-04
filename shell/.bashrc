# ----------------------------------------------------------------------
# This is available to help trace shell startup files

function _add_breadcrumb() {
    if [ ! -z "$1" ]; then export BREADCRUMBS=$BREADCRUMBS:$1; fi
}

function _trace_it() {
    # echo -n "from "; echo -n "'"$(pwd)"': ";
    if [ ! -z "$1" -a ! -z "$DEBUG_BASH" ]; then
        echo $1
        _add_breadcrumb $1
    fi
}

# ----------------------------------------------------------------------
# Just making a little helper to conditionally include a `source` command
# if the file exists. There seems to be 12 different ways to do this, and I'm
# sick of wondering which is best.
#
# So `safe_source` expects a single argument. If it's not an empty
# string (missing argument) and the file named by the argument exists, then
# call source on it. Boom. Also, an error message if it doesn't exist.
function safe_source() {
    if [ ! -z "$1" ]; then
        if [ -s $1 ]; then
            source "$1"
        else
            >&2 echo "error: cannot source '$1', file does not exist."
        fi
    fi
}

# ----------------------------------------------------------------------

_trace_it $DOTFILES_HOME/shell/.bashrc

# If my personal shared bash profile exists, source it
safe_source $DOTFILES_HOME/shell/bash_profile.sh

# If the iterm2 shell integration script exists, source it
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
safe_source ${HOME}/.iterm2_shell_integration.bash
