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
