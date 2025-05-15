# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.shellrc ]; then
  source ~/.shellrc
fi
