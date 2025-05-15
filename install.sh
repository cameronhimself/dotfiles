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

stow dotfiles
