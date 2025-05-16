# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.shellrc ]; then
  source ~/.shellrc
fi

unset MAILCHECK

export BASH_IT="~/.bash_it"
export BASH_IT_THEME=demula
export SCM_CHECK=true

source "$BASH_IT"/bash_it.sh
