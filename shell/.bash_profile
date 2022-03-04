# my local ~/.bash_profile, basically the first thing that runs after system-wide
# stuff, sets up and runs .bashrc

export DOTFILES_HOME=${HOME}/Dropbox/dotfiles
export BREADCRUMBS=${DOTFILES_HOME}/.bashrc
# export DEBUG_BASH=1

if [ ! -z "$DEBUG_BASH" ]; then echo ${DOTFILES_HOME}/shell/.bash_profile; fi

[[ -s ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

[[ -s ${DOTFILES_HOME}/shell/finalize.sh ]] && source ${DOTFILES_HOME}/shell/finalize.sh
