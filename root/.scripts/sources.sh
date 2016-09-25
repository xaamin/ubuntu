alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ls='ls -hFG'
alias l='ls -lF'
alias ll='ls -alF'
alias lt='ls -ltrF'
alias ll='ls -alF'
alias lls='ls -alSrF'
alias llt='ls -altrF'

alias tarc='tar cvf'
alias tarcz='tar czvf'
alias tarx='tar xvf'
alias tarxz='tar xvzf'

alias g='git'
alias less='less -R'
alias os='lsb_release -a'
alias vi='vim'

# Colorize directory listing
alias ls="ls -ph --color=auto"

# Colorize grep
if echo hello|grep --color=auto l >/dev/null 2>&1; then
	alias grep="/bin/grep --color=auto"
  	export GREP_COLOR="1;31"
fi

# Shell
export CLICOLOR="1"

if [ -f $HOME/.scripts/git-prompt.sh ]; then
  	source $HOME/.scripts/git-prompt.sh
  	export GIT_PS1_SHOWDIRTYSTATE="1"
  	export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;32m\]\w $(__git_ps1 \[\033[35m\]{\[\033[35m\]%s\[\033[35m\]})\[\033[34m\]\[\033[00m\]\$ '
else
  	export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Git
source $HOME/.scripts/git-completion.sh
source $HOME/.scripts/git-prompt.sh