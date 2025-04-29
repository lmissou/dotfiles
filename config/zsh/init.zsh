# zsh history file
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
# set editor
export EDITOR=nvim
# key timeout 0.2s (example: jk)
export KEYTIMEOUT=20
# set vi-mode keymaps
set -o vi
bindkey -v
bindkey -s -M viins 'jk' '^['
bindkey -M vicmd 'gh' beginning-of-line
bindkey -M vicmd 'gl' end-of-line
for mode in 'vicmd' 'viins'
do
  bindkey -M $mode '^d' delete-char
  bindkey -M $mode '^f' forward-char
  bindkey -M $mode '^b' backward-char
  bindkey -M $mode '\ef' forward-word
  bindkey -M $mode '\eb' backward-word
  bindkey -M $mode '^e' end-of-line
  bindkey -M $mode '^a' beginning-of-line
  bindkey -M $mode '^p' up-line-or-history
  bindkey -M $mode '^n' down-line-or-history
done
# Edit command line in EDITOR
function vi-edit-command-line() {
  # Create a temp file and save the BUFFER to it
  local tmp_file=$(mktemp /tmp/zsh-command-line-XXXXXX.zsh)
  # Some users may config the noclobber option to prevent from
  echo "$BUFFER" >! "$tmp_file"
  # Edit the file with the specific editor
  ${EDITOR:-vi} $tmp_file </dev/tty
  # Reload the content to the BUFFER from the temp
  BUFFER=$(cat $tmp_file)
  # file after editing, and delete the temporary file.
  rm "$tmp_file"
}
zle -N vi-edit-command-line 
# edit command line with $EDITOR
bindkey -M emacs '\ee' vi-edit-command-line
bindkey -M vicmd '\ee' vi-edit-command-line
bindkey -M viins '\ee' vi-edit-command-line

function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

# zinit config
declare -A ZINIT=(
  [NO_ALIASES]=1
)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

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
# zoxide, smarter cd command
if (($+commands[zoxide])) then
  eval "$(zoxide init zsh)"
fi
# Set up fzf key bindings and fuzzy completion
if (($+commands[fzf])) then
  source <(fzf --zsh)
  zinit light Aloxaf/fzf-tab
fi
# zellij
if (($+commands[zellij])) then
  alias ze=zellij
  alias za="zellij attach"
  function _zellij_start_or_attach {
    zle push-line # Clear buffer.
    if [[ -z `zellij list-sessions | grep -o default` ]]; then
      BUFFER="zellij --session=default"
    else
      BUFFER="zellij attach default"
    fi
    zle accept-line
  }
  zle -N _zellij_start_or_attach
  bindkey -M emacs '\ez' _zellij_start_or_attach
  bindkey -M vicmd '\ez' _zellij_start_or_attach
  bindkey -M viins '\ez' _zellij_start_or_attach
fi
# yazi
if (($+commands[yazi])) then
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
  function _y {
    zle_eval y
  }
  zle -N _y
  bindkey -M emacs '\ey' _y
  bindkey -M vicmd '\ey' _y
  bindkey -M viins '\ey' _y
fi
# lazygit
if (($+commands[lazygit])) then
  function _lazygit {
    zle_eval lazygit
  }
  zle -N _lazygit
  bindkey -M emacs '\eg' _lazygit
  bindkey -M vicmd '\eg' _lazygit
  bindkey -M viins '\eg' _lazygit
fi

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

