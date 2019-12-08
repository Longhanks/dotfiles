export LC_ALL=en_US.UTF-8	
export LANG=en_US.UTF-8
export LANGUAGE=en

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
    mkdir -p $XDG_CACHE_HOME/vim/{undo,swap,backup}
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
if command -v pacman > /dev/null 2>&1; then
    if [[ ! -d $XDG_CONFIG_HOME/pacman ]]; then
        mkdir -p $XDG_CONFIG_HOME/pacman
    fi
fi
if [[ -d $XDG_DATA_HOME/cargo/bin ]]; then
    export PATH=$XDG_DATA_HOME/cargo/bin:$PATH
fi
if [[ -d $HOME/.cargo/bin ]]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

# Home of oh-my-zsh.
export ZSH=$HOME/.config/zsh/.oh-my-zsh

# oh-my-zsh theme.
ZSH_THEME="sorin-aschulz"

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
if [ $(uname -s) = "Darwin" ]; then
    pkgplugin=brew
else
    if [ -f /etc/os-release ]; then
        cat /etc/os-release | grep ID_LIKE | read id; pkgplugin=${id:8}
    fi
fi

plugins=(git cargo pip zsh-autosuggestions $pkgplugin)

# Disable oh-my-zsh group permission audits.
ZSH_DISABLE_COMPFIX=true

# oh-my-zsh is ready, source it.
source $ZSH/oh-my-zsh.sh


# Customization after oh-my-zsh initialized.

# Aliases & environment variables.
if command -v bat > /dev/null 2>&1; then
    export BAT_THEME="TwoDark"
    alias cat=bat
fi

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GEMRC="$XDG_CONFIG_HOME"/gem/gemrc
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GPG_TTY=$(tty)
export HISTFILE=$HOME/.cache/zsh/.zsh_history
export HOMEBREW_NO_AUTO_UPDATE=1
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PINENTRY_USER_DATA="USE_CURSES=1"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export RLWRAP_HOME="$XDG_DATA_HOME"/rlwrap
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java $_JAVA_OPTIONS"

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
            alias vim=nvim
            export EDITOR=nvim
        else
            export EDITOR=vim
        fi
        export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
        export SYSTEMD_PAGER=""
        ;;
esac

