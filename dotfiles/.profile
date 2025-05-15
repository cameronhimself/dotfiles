if [ -f ~/.local_profile ]; then
  source ~/.local_profile
fi

source ~/.secrets
export PATH="$HOME/bin:$PATH"
