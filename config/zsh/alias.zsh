
alias c=clear
alias e=exit
alias lock=i3lock-fancy
# neovim
alias vi=nvim
alias vim=nvim
# ranger简写别名
alias ra=ranger
# 退出ranger时进入所选文件夹
alias cdr='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias cat=bat
alias grep=rg
alias ec=emacsclient
# alias ls=lsd
alias l="ls -l"
alias la="ls -ail"
alias lt="ls --tree"
alias tl="tmux list-sessions"
alias ta="tmux attach"
alias pa="ps -aux"
alias pg="pa | grep"

