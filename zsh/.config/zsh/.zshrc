export LC_ALL=de_DE.UTF-8
export LANG=de_DE.UTF-8
export ZSH=$HOME/.config/zsh/.oh-my-zsh
export TERM=xterm-256color
export EDITOR=nvim
export HOMEBREW_NO_AUTO_UPDATE=1
export PAGER=most
export MANPATH=$HOME/.local/share/man:$MANPATH
if [[ ! -d $HOME/.cache/zsh ]]; then
    mkdir -p $HOME/.cache/zsh
fi
if [[ ! -d $HOME/.cache/vim ]]; then
    mkdir -p $HOME/.cache/vim
fi
export HISTFILE=$HOME/.cache/zsh/.zsh_history
ZSH_THEME="sorin"

alias vim=nvim
alias workspace-attach='ssh -o SendEnv=COLORTERM -p 12132 aschulz@www.as-schulz.de -t "/usr/local/bin/tmux -u a -t aschulzmux || /usr/local/bin/tmux -u new -s aschulzmux"'
alias sqlplus='docker run -it --rm --net=host guywithnose/sqlplus sqlplus'

# To customize prompt
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

# Find out package manager.
case `uname -s` in
    Darwin)
        pkgplugin=brew
        ;;
    Linux)
        pkgplugin=debian
        ;;
esac

plugins=(git pip zsh-autosuggestions pkgplugin)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Some ls color settings
if [[ $(uname -s) == 'Linux' ]]; then
    export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi

