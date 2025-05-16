if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

if command -v mise 2>&1 >/dev/null; then
  eval "$(mise activate bash)"
fi

if command -v direnv 2>&1 >/dev/null; then
  eval "$(direnv hook bash)"
fi
