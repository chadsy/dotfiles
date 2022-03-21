#!/usr/bin/env bash
declare -F _trace_it &>/dev/null && _trace_it $DOTFILES_HOME/shell/prompt.sh

# ----------------------------------------------------------------------

PROMPT_DIRTRIM=3
PROMPT_COMMAND=_minimal_git_grey

WHITE='\[\e[97m\]'
DARK_GREY='\[\e[90m\]'
LIGHT_GREY='\[\e[37m\]'
GREY_BG='\[\e[47m\]'
DARK_GREY_BG='\[\e[100m\]'

RESET_BG='\[\e[49m\]'
RESET_COLOR='\[\e[39m\]'

PROMPT_CARET=':'

# ----------------------------------------------------------------------
# emits '*' to indicate a dirty git branch
function _is_git_branch_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

# ----------------------------------------------------------------------
# emits current git branch name with optional '*' if dirty
function current_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(_is_git_branch_dirty)/"
}

# ----------------------------------------------------------------------

function _minimal_git_grey() {
    CWD_STRING="${LIGHT_GREY}${DARK_GREY_BG} \w ${RESET_COLOR}${RESET_BG}"

    BRANCH_NAME=$(current_git_branch)
    if [ -z "$BRANCH_NAME" ]; then
        BRANCH_STRING=""
    else
        BRANCH_STRING="${DARK_GREY}${GREY_BG} ${BRANCH_NAME} ${RESET_COLOR}${RESET_BG}"
    fi

    PS1="${CWD_STRING}${BRANCH_STRING}\n${DARK_GREY_BG}${WHITE}${PROMPT_CARET}${RESET_COLOR}${RESET_BG} "
}
