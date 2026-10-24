#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# hypr
cp "$DOTFILES_DIR/omarchy/hypr/"* "$HOME/.config/hypr/"
