# Set XDG dirs.
if [ -z "${XDG_CONFIG_HOME+x}" ]; then
    export XDG_CONFIG_HOME="$HOME"/.config
fi 
if [ -z "${XDG_CACHE_HOME+x}" ]; then
    export XDG_CACHE_HOME="$HOME"/.cache
fi
if [ -z "${XDG_DATA_HOME+x}" ]; then
    export XDG_DATA_HOME="$HOME"/.local/share
fi

# Create necessary dirs.
if [[ ! -d $XDG_CACHE_HOME/zsh ]]; then
    mkdir -p $XDG_CACHE_HOME/zsh
fi
if [[ ! -d $XDG_CACHE_HOME/vim ]]; then
    mkdir -p $XDG_CACHE_HOME/vim
fi
if [[ ! -d $XDG_CACHE_HOME/vim/backup ]]; then
    mkdir -p $XDG_CACHE_HOME/vim/backup
fi
if [[ ! -d $XDG_CONFIG_HOME/vim ]]; then
    mkdir -p $XDG_CONFIG_HOME/vim
fi
if [[ ! -d $XDG_CONFIG_HOME/less ]]; then
    mkdir -p $XDG_CACHE_HOME/less
fi
if [[ ! -d $XDG_CONFIG_HOME/npm ]]; then
    mkdir -p $XDG_CONFIG_HOME/npm
fi
if [[ ! -d $XDG_CACHE_HOME/npm ]]; then
    mkdir -p $XDG_CACHE_HOME/npm
fi
if [[ ! -d $XDG_CONFIG_HOME/gem ]]; then
    mkdir -p $XDG_CONFIG_HOME/gem
fi
if [[ ! -d $XDG_CACHE_HOME/gem ]]; then
    mkdir -p $XDG_CACHE_HOME/gem
fi
if [[ ! -d $XDG_DATA_HOME/gem ]]; then
    mkdir -p $XDG_DATA_HOME/gem
fi

# Home of oh-my-zsh.
export ZSH=$HOME/.config/zsh/.oh-my-zsh

# oh-my-zsh theme.
ZSH_THEME="sorin"

# To customize prompt.
DEFAULT_USER="aschulz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh/custom/

# OS-specific settings.
case `uname -s` in
    Darwin)
        pkgplugin=brew
        ;;
    Linux)
        pkgplugin=debian
        ;;
esac

plugins=(git pip zsh-autosuggestions pkgplugin)

# oh-my-zsh is ready, source it.
source $ZSH/oh-my-zsh.sh


# Customization after oh-my-zsh initialized.

# Aliases & environment variables.
alias workspace-attach='ssh -p 12132 aschulz@www.as-schulz.de'
alias sqlplus='docker run -it --rm --net=host guywithnose/sqlplus sqlplus'

export HOMEBREW_NO_AUTO_UPDATE=1
export PAGER=most
export HISTFILE=$HOME/.cache/zsh/.zsh_history
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java $_JAVA_OPTIONS"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export RLWRAP_HOME="$XDG_DATA_HOME"/rlwrap
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GEMRC="$XDG_CONFIG_HOME"/gem/gemrc


if [[ $(uname -s) == 'Linux' ]]; then
    export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi

# OS-specific settings.
case `uname -s` in
    Darwin)
        if [ ! -z "$(command -v nvim)" ]; then
            alias vim=nvim
            export EDITOR=nvim
        else
            export EDITOR=vim
        fi
        ;;
    Linux)
        if [ ! -z "$(command -v nvim)" ]; then
            if [ ! -z "${DISPLAY+x}" ]; then
                alias vim='$HOME/.config/zsh/blur_wrap nvim'
                export EDITOR='$HOME/.config/zsh/blur_wrap nvim'
            else
                alias vim=nvim
                export EDITOR=nvim
            fi
        else
            if [ ! -z "${DISPLAY+x}" ]; then
                alias vim='$HOME/.config/zsh/blur_wrap vim'
                export EDITOR='$HOME/.config/zsh/blur_wrap vim'
            else
                export EDITOR=vim
            fi
        fi
        if [ ! -z "${DISPLAY+x}" ]; then
            alias ssh='$HOME/.config/zsh/blur_wrap ssh'
            for konsole in $(xdotool search --class konsole); do
                if [[ "$konsole" == "$(xdotool getactivewindow)" ]]; then
                    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $konsole;
                fi
            done
            for yakuake in $(xdotool search --class yakuake); do
                if [[ "$yakuake" == "$(xdotool getactivewindow)" ]]; then
                    xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $yakuake;
                fi
            done
        fi
        ;;
esac

