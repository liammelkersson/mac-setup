#!/usr/bin/env bash
# Set up a fresh Mac. Safe to re-run: each step skips what is already installed.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Xcode command line tools"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Finish the Xcode tools install in the popup, then re-run this script."
  exit 0
fi

echo "==> Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Homebrew packages and apps (Brewfile)"
brew bundle --file="$REPO_DIR/Brewfile"

echo "==> Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
clone_if_missing() { [ -d "$2" ] || git clone --depth=1 "$1" "$2"; }
clone_if_missing https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "==> Dotfiles"
link() {
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.backup"; fi
  ln -sf "$1" "$2"
}
link "$REPO_DIR/dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"
link "$REPO_DIR/dotfiles/zed/settings.json" "$HOME/.config/zed/settings.json"
link "$REPO_DIR/dotfiles/zed/themes/apple.json" "$HOME/.config/zed/themes/apple.json"

echo "==> Bun"
command -v bun >/dev/null 2>&1 || curl -fsSL https://bun.sh/install | bash

echo "==> Node (via nvm)"
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
# shellcheck disable=SC1091
. "$(brew --prefix nvm)/nvm.sh"
nvm install --lts

echo "==> Folders"
mkdir -p "$HOME/dev"

echo "Done. Open a new terminal and see README.md for the manual steps."
