
alias c=clear
alias e=exit
alias lock=i3lock-fancy
# ranger简写别名
alias rag=ranger
# 退出ranger时进入所选文件夹
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias cat=bat
alias grep=rg
alias ec=emacsclient
alias ls=lsd
alias l="lsd -l"
alias la="lsd -ail"
alias lt="lsd --tree"
alias td="tmux detach"
alias ta="tmux attach"
alias pa="ps -aux"
alias pg="pa | grep"

