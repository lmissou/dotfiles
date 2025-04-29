# 配置命令别名
alias c=clear
alias e=exit
alias l="ls -l"
alias la="ls -ail"
alias lt="ls --tree --depth=3"
alias lta="ls --tree"
alias pa="ps -aux"
alias pg="pa | grep"
# neovim
if (($+commands[nvim])) then
  alias vi=nvim
  alias vim=nvim
fi
if (($+commands[bat])) then
  alias cat=bat
fi
if (($+commands[rg])) then
  alias grep=rg
fi
if (($+commands[lsd])) then
  alias ls=lsd
fi
