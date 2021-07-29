# TODO:
# http://brettterpstra.com//2019/01/15/stuff-ive-made-and-actually-use/
# http://brettterpstra.com/2013/03/31/a-few-more-of-my-favorite-shell-aliases/
# http://brettterpstra.com/2013/03/30/a-multi-purpose-editor-variable/
# http://brettterpstra.com/projects/reiki/
# http://brettterpstra.com/projects/where/
# learn 'ack' https://sourabhbajaj.com/mac-setup/iTerm/ack.html
# http://macappstore.org/fasd/ and https://github.com/clvv/fasd

# easy to write help scripts
# https://samizdat.dev/help-message-for-shell-scripts/

# inputrc stuff for readline()
# https://www.topbug.net/blog/2017/07/31/inputrc-for-humans/
# https://brettterpstra.com/2015/07/09/shell-tricks-inputrc-binding-fun/

# AND move all this to the shared bash script in dropbox folder,
# then call it via 'source' command

# learn merging, resolving, rebasing, and squashing

# ----------------------------------------------------------------------
#
# chad's bash config
#
# run shitToRunOnce on new machines
#
# ----------------------------------------------------------------------
# some random resources
#
# https://github.com/barryclark/bashstrap/blob/master/.bash_profile
# https://github.com/nojhan/liquidprompt
# https://medium.freecodecamp.org/jazz-up-your-bash-terminal-a-step-by-step-guide-with-pictures-80267554cb22
# http://brettterpstra.com/2013/03/31/a-few-more-of-my-favorite-shell-aliases/
# http://brettterpstra.com//2019/01/15/stuff-ive-made-and-actually-use/

# ----------------------------------------------------------------------

# install https://blog.timac.org/2018/1112-quicklook-plugin-to-visualize-car-files/

# ----------------------------------------------------------------------
alias lsd="ls -daG */"
alias lsa="ls -laFG"
alias l="ls -FG"
# alias ls="ls -laFG"

alias sync_folders="lsd | xargs -I % sh -c 'cd %; echo ------------ syncing %; git fetch; git pull; cd ..'"
alias unepoch="date -r"
alias gr="./gradlew"

alias comp="bcompare"

alias reload_shell="source ~/Dropbox/mactools/dot_bash_profile.sh"

alias datecode="date -j '+%Y%m%d'"

alias gs="git status -bs"
alias gp="git fetch; git pull"
alias gco="git fetch; git checkout"

alias todock="cd ~/docker-local"
alias dock="docker-compose up -d "
alias undock="docker-compose down"

alias pson="python3 -m json.tool"

alias create_uuid="python -c 'import sys,uuid; sys.stdout.write(str(uuid.uuid4()))' | pbcopy && pbpaste && echo"

# alias findstr="grep -R"

PATH=$PATH:~/Dropbox/mactools

# ----------------------------------------------------------------------
# docker (chadsy, the man fred) (https://hub.docker.com/editions/community/docker-ce-desktop-mac)
# pip: get-pip.py in tools (https://pip.pypa.io/en/latest/)
# aws cli: pip install awscli
# OKTA for store AWS: https://gitlab.corp.zulily.com/awstools/okta#installation
# ln -s ~/.okta/awscli /Users/croyal/Dropbox/mactools

# ----------------------------------------------------------------------
# git completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
# echo Installing Bash Completion

# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
#     # if not found in /usr/local/etc, try the brew --prefix location
#     [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
#         . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
# }

# source ~/Dropbox/mactools/git-flow-completion.bash


# TODO: Make a function of this to get the epoch
# date -j -f "%Y-%m-%d %H:%M:%S" "2018-01-30 15:58:50" "+%s"

# this loads oh-my-bash and is kind of a massive shitshow of name/alias pollution
# if [ -f $HOME/.bashrc ]; then
#         source $HOME/.bashrc
# fi

function epochit() {
    date -j -f "%Y-%m-%d %H:%M:%S" "$1 00:00:00" "+%s"
}

# ----------------------------------------------------------------------
# some prompt crap
# !!! This! https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# https://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
# https://gist.github.com/loudambiance/a41b42a4295bce6e7304
# https://gist.github.com/natelandau/10654137

# PS1='\e[1;34m\]\W \e[0;34m\](\w)  \e[32m\]$(parse_git_branch)\n ⚡ \e[m\]'
# PS1='\e[1;31m\]$(parse_git_branch)  \e[0;34m\](\w)\n\e[1;34m\]\W\e[m\] $ '
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
# PS2="\e[1;33m\] → \e[m\]"
# PS1='\e[100m\]\e[1;96m\]  $(parse_git_branch)  \e[m\]\e[100m\]\e[37m\](\w)  \e[m\]\n\e[1;34m\]\W\e[m\] $ '

PROMPT_DIRTRIM=1
PROMPT_COMMAND=doThePrompt

WHITE='\[\e[97m\]'
BLACK='\[\e[30m\]'
GREEN='\[\e[32m\]'
BLUE='\[\e[91m\]'
BOLD='\[\e[1m\]'
NORMAL='\[\e[0m\]'
DARK_GREY='\[\e[90m\]'
LIGHT_GREY='\[\e[37m\]'

GREY_BG='\[\e[47m\]'
DARK_GREY_BG='\[\e[100m\]'

RESET_BG='\[\e[49m\]'
RESET_COLOR='\[\e[39m\]'

function doThePrompt() {
    PWD_STRING="${LIGHT_GREY}${DARK_GREY_BG} \w ${RESET_COLOR}${RESET_BG}"

    BRANCH_NAME=$(parse_git_branch)
    if [ -z "$BRANCH_NAME" ]; then
        BRANCH_STRING=""
    else
        BRANCH_STRING="${DARK_GREY}${GREY_BG} $BRANCH_NAME ${RESET_COLOR}${RESET_BG}"
    fi

    PS1="  $PWD_STRING$BRANCH_STRING\n${BOLD}${BLUE}>${NORMAL}${RESET_COLOR} "
}

export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

function dash() {
    if [[ "$2" == "" || "$1" == "" ]]; then
        echo "usage: dash <docset> <searchterm>"
        return 1
    else
        echo "dash://$1:$2"
        open dash://$1:$2
    fi
}

# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
# Zulily crap
alias awsopen="awscli -a bids"
#alias awsopen="awscli -a store"

function cloc() {
    if [[ "$1" == "" ]]; then
        filespec="."
    else
        filespec=$1
    fi

    echo Lines in $filespec
    (find ./ -name $filespec -print0 | xargs -0 cat) | wc -l
}

# ----------------------------------------------------------------------
# handles rsync for the Cannon Beach Financial folder
# rsync -aE -delete /Volumes/Citrix\ Files/Folders/Client\ -\ Royal/ ~/Dropbox/sort/junmin/ShareFileSync/

# ----------------------------------------------------------------------
# TODO: Write a simple test for the existence of /users/croyal and sets a
# IS_ZULILY flag so that a bunch of stuff in here can be filtered on non
# zulily machines

# ----------------------------------------------------------------------
# returns the specific zulily gitlab token for me, called 'shell script CURL API'
function gitlabToken() {
    # created on 20200409
    echo 'zgVzHaQrDsJtKuUSi9xP'
}

function mapiToken() {
    echo '433f16ffcbac9f427128076cf224fa86'
}

function gitjson() {
    gitcurl $@ | pson
}

# ----------------------------------------------------------------------
# simplifies CURL to zulily gitlab
function gitcurl() {
    if [[ "$1" == "help" ]]; then
        echo "gitcurl - sends the command line to gitlab at the end of /api/v4"
        echo "          and runs it thru python3 json tool to prettify it."
        echo ""
        echo common uses:
        echo "   /version (shows gitlab version)"
        echo "   /user/406 (shows Chad's user info)"
        echo "   /groups/445 (shows catalog team's repos)"
        echo ""
        echo "You can add ?per_page=100 to get more back"
        echo ""
        return 1
    fi

    curl -s --header "PRIVATE-TOKEN: $(gitlabToken)" "https://gitlab.corp.zulily.com/api/v4"$@
}

# ----------------------------------------------------------------------
# open SSH to AWS box, given EC2 instance name as parameter; defaults to MAPI CI without parameter
function awsssh() {
    if [[ "$1" == "" ]]; then
        echo Please specify a valid, live EC2 instance name. Here are the common ones:
        echo - store-zapi-dev-01-host
        echo - store-zapi-dev-02-host
        echo - store-zapi-dev-03-host
        echo - store-zapi-dev-04-host
        echo - store-zapi-ci-host
        echo - store-zapi-staging-host
        echo - store-zapi-prod-host
        return 1
    else
        hostID=$1
    fi

    SERVER_IP=`awsgetip "$hostID"`
    echo connecting to $hostID at $SERVER_IP

    ssh-keyscan $SERVER_IP >> ~/.ssh/known_hosts;

    ssh -i ~/.ssh/store-dev-keypair.pem ec2-user@$SERVER_IP;
}

# ----------------------------------------------------------------------
# internal function to get the EC2 instance IP address
function awsgetip() {
    if [[ "$1" == "" ]]; then
        echo no host
        return 1
    else
        hostID=$1
    fi

    aws configure set aws_access_key_id "AKIAJXY5C52USINMSTEQ" --profile infraops-admin
    aws configure set aws_secret_access_key "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" --profile infraops-admin
    SERVER_IP=$(aws ec2 --profile infraops-admin describe-instances --region=us-east-1 --filter "Name=tag:Name,Values=$hostID" "Name=instance-state-name,Values=running" --query "Reservations[0].Instances[0].PrivateIpAddress" --output=text);

    echo $SERVER_IP
}

# end Zulily crap
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# sometimes a fella just wants a simple way to find a string in some files, recursively
function findstr () {
    if [[ "$#" == 1 ]]; then
        folder="./*"
        findVal="-e ${1}"
        shift
        folderName="current folder"
    elif [[ "$#" == 2 ]]; then
        folder=$1
        findVal="-e ${2}"
        shift
        shift
        folderName=$folder
    elif [[ "$#" -gt 2 ]]; then
        folder=$1
        findVal="-e ${2}"
        shift
        shift
        folderName=$folder
    else
        echo usage: findstr [filespec] string
        return 1
    fi

    grep -R $folder $@ $findVal
}

# ----------------------------------------------------------------------
# useful shortcut for find that is case-insenstive and allows for a starting folder parameter
function where () {
    if [[ "$#" == 1 ]]; then
        folder="."
        findVal=$1
        folderName="current folder"
    elif [[ "$#" == 2 ]]; then
        folder=$1
        findVal=$2
        folderName=$folder
    else
        echo usage: where [folder] name
        return 1
    fi

    result=`find $folder -iname $findVal`

    if [[ "$result" == "" ]]; then
        echo did not find $findVal in $folderName
        return 1
    else
        echo $result
        return 0
    fi
}

# ----------------------------------------------------------------------
# emits '*' to indicate a dirty git branch
function is_git_branch_dirty() {
    [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

# ----------------------------------------------------------------------
# emits current git branch name with optional '*' if dirty
function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(is_git_branch_dirty)/"
}

# ----------------------------------------------------------------------
# run this on new or clean machine to set things up hapily
function shitToRunOnce() {

    echo "Enable some sudo stuff now"
    sudo nvram StartupMute=%00

    echo "Make sure to put AWS PEMs into ~/.ssh/*, including bids-dev-keypair.pem and store-dev-keypair.pem"

    # enable text selection in Finder's QuickLook
    # TODO: No longer works in Sierra or later
    # defaults write com.apple.finder QLEnableTextSelection -bool TRUE; killall Finder

    # brew install git-lfs

    # show build time in Xcode operation status area
    defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES

    # sublime text editor link for command-line launching
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

    # plistbuddy!
    # ln -s "/usr/libexec/plistbuddy" /usr/local/bin/plistbuddy
    # get this from xcode?

    # case-insensitive tab completion
    # TODO: Consider moving these to ~/.inputrc 
    echo set completion-ignore-case on | sudo tee -a /etc/inputrc
    echo set show-all-if-ambiguous off | sudo tee -a /etc/inputrc

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

    brew install ack
}

