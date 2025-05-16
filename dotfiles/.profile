if [ -f ~/.local_profile ]; then
  source ~/.local_profile
fi

if [ -f ~/.personal ]; then
  source ~/.personal
fi

if [ -f ~/.secrets ]; then
  source ~/.secrets
fi

export EDITOR="vim"
export VISUAL="$EDITOR"
export PATH="$HOME/bin:$PATH"
export GOPATH="$home/.go"
