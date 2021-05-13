# zim配置
: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh
# 主题配置
ZSH_THEME="ys"

source ${ZIM_HOME}/login_init.zsh -q &!
source ~/.config/zsh/alias.zsh
source ~/.config/zsh/keys.zsh
source ~/.config/zsh/fzf.zsh

