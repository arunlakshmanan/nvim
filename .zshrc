# Arun Lakshmanan

# zplug init {{{
source ~/.zplug/init.zsh
# }}}

# zplug packages {{{
zplug "plugins/git", from:oh-my-zsh

# forked from @frmendes
zplug "arunlakshmanan/geometry"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
# }}}

# zplug load {{{
zplug "~/.zsh", from:local

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
# }}}

# appearance {{{
# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# vi completion
zstyle ':completion:*:*:vi:*:*files' ignored-patterns '*.o' '*.pyc'
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' '*.pyc'
zstyle ':completion:*:*:nvim:*:*files' ignored-patterns '*.o' '*.pyc'

# disable annoying beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# autosuggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}

# history {{{
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups  # ignore duplication command history list
setopt hist_ignore_space # ignore when commands starts with space
setopt share_history     # share command history data
# }}}

# vi bindings {{{
export KEYTIMEOUT=20

bindkey -v

# Use jk for ESC
bindkey -M viins 'jj' vi-cmd-mode

# Use vim cli mode
bindkey '^j' up-history
bindkey '^k' down-history

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
# }}}

# fzf {{{
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# ros {{{
export PS1="$ROSE\$(git_star)\$(parse_git_branch)${TARDIS}\\u:${ORANGE}\\W\$${RESET} "
export ROS_DISTRO=kinetic
export ROS_PACKAGE_PATH=/opt/ros/$ROS_DISTRO/share:/opt/ros/$ROS_DISTRO/stacks
export ROS_IP=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}')

source /opt/ros/$ROS_DISTRO/setup.zsh
source $HOME/catkin_ws/devel/setup.zsh
# }}}

# cf-debugging {{{
export PATH=$PATH:$HOME/bin/gcc-arm-none-eabi/bin
# }}}

# matlab {{{
export PATH=$PATH:/usr/local/MATLAB/R2016a/bin
# }}}

# texlive {{{
export PATH=$PATH:/opt/texbin
# }}}

# aliases {{{
alias ls='ls --color'
alias ll='ls -al'
alias lh='ls -hl'
alias l='ls -alt'
alias sudo='sudo '
alias tlmgr='env PATH="$PATH" tlmgr'
# }}}

# vim:foldmethod=marker:foldlevel=0
