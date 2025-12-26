function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

# zoxide, smarter cd command
if (($+commands[zoxide])) then
  eval "$(zoxide init zsh)"
fi
# Set up fzf key bindings and fuzzy completion
if (($+commands[fzf])) then
  source <(fzf --zsh)
  zpcompinit; zpcdreplay
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
