# zsh history file
HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
# set editor
export EDITOR=nvim
# set emacs keymaps
set -o emacs
bindkey -e

# zinit config
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
unalias zi

# zinit plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zdharma/fast-syntax-highlighting

# 配置命令别名
alias c=clear
alias e=exit
alias l="ls -l"
alias la="ls -ail"
alias lt="ls --tree"
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
# zoxide, smarter cd command
if (($+commands[zoxide])) then
  eval "$(zoxide init zsh)"
fi
# zellij
if (($+commands[zellij])) then
  alias ze=zellij
  alias za="zellij attach"
  function _zellij_start_or_attach() {
    zle push-line # Clear buffer.
    if [[ `pidof zellij` ]]; then
      BUFFER="zellij attach"
    else
      BUFFER="zellij"
    fi
    zle accept-line
  }
  zle -N _zellij_start_or_attach
  bindkey -M emacs '^[z' _zellij_start_or_attach
  bindkey -M vicmd '^[z' _zellij_start_or_attach
  bindkey -M viins '^[z' _zellij_start_or_attach
fi
# Set up fzf key bindings and fuzzy completion
if (($+commands[fzf])) then
  source <(fzf --zsh)
  zinit light Aloxaf/fzf-tab
fi

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# 配置powerlevel10k主题
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# setting theme
ZSH_THEME="powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

