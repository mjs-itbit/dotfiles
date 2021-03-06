function _log() {
    echo `date +%FT%T%z` ' -- ' $*
}

source $HOME/.bashrc

CDPATH=.:~:~/SRC:~/Documents:~/Movies

export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r "$HOME/.rvm/scripts/completion" ]] && . "$HOME/.rvm/scripts/completion"

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
    __git_complete g __git_main
fi

if [ -f /usr/local/Library/Contributions/brew_bash_completions.sh ]; then
    . /usr/local/Library/Contributions/brew_bash_completions.sh
fi

reset=$'\e[0m'
cyan=$'\e[0;36m'
yellow=$'\e[0;33m'
red=$'\e[0;31m'
purple=$'\e[0;35m'
green=$'\e[0;32m'
blue=$'\e[0;34m'
grey=$'\e[1;30m'

function _pscolor() {
    if [ $? -ne 0 ]; then
        echo -e $red
    else
        echo -e $cyan
    fi
}
export PS1='\[$(_pscolor)\]\A \h:\W\[${reset}\]> '

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
