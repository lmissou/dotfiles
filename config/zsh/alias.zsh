
alias c=clear
alias e=exit
alias lock=i3lock-fancy
# neovim
if (($+commands[nvim])) then
  alias vi=nvim
  alias vim=nvim
fi
# ranger简写别名
alias ra=ranger
# 退出ranger时进入所选文件夹
alias cdr='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
if (($+commands[bat])) then
  alias cat=bat
fi
if (($+commands[rg])) then
  alias grep=rg
fi
alias ec=emacsclient
if (($+commands[lsd])) then
  alias ls=lsd
fi
alias l="ls -l"
alias la="ls -ail"
alias lt="ls --tree"
alias tl="tmux list-sessions"
alias ta="tmux attach"
alias pa="ps -aux"
alias pg="pa | grep"

