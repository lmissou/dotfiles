# my key bindings for zsh

# vi keybinding
# bindkey -v

# emacs keybinding
bindkey -e #emacs
# CTRL-R - Paste the selected command from history into the command line
bindkey '^R' fzf-history-widget
# ALT-D - Paste the selected file path(s) into the command line
bindkey '\ed' fzf-file-widget
# CTRL-G - goto (cd) into the selected directory
bindkey '^G' fzf-cd-widget
# C-T attach tmux
bindkey -s '^T' 'tmux attach\n'
