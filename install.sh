#!/usr/bin/bash
set -e
set -o pipefail

if ! command -v direnv &> /dev/null; then
  echo "Install direnv."
  exit 1
fi

if [ ! -f .envrc ]; then
  echo "Copy .envrc.example to .envrc and insert values before running this script."
fi

if [ ! -e ~/.bash_it ]; then
  git clone --quiet --depth 1 --branch v3.0.3 https://github.com/Bash-it/bash-it.git ~/.bash_it
fi

echo "#!/usr/bin/bash" > dotfiles/.secrets
if command -v bw &> /dev/null; then
  bw logout || true
  bw config server "$BITWARDEN_URL"
  bw login --apikey
  BW_SESSION=$(bw unlock --raw)
  bw get item "$BITWARDEN_DOTFILE_SECRET_NAME" \
    | jq -r '.fields | map("export " + .name + "=" + .value) | .[]' \
    >> dotfiles/.secrets
else
  echo "Install BitWarden CLI to set up secrets."
fi

if [ -f personal ]; then
  cp personal dotfiles/.personal
else
  echo "Be sure to copy 'personal.example' to 'personal' and add your info, then run this command again."
fi

stow dotfiles

echo "Done! It's probably a good idea to restart your terminal."