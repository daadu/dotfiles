#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_dotfiles() {
    local src="$1"
    local dst="$2"

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        read -r -p "$dst already exists. Overwrite? [y/N] " reply
        case "$reply" in
            [yY][eE][sS]|[yY])
                ;;
            *)
                echo "Skipping $dst"
                return 0
                ;;
        esac
    fi

    echo "Linking $src -> $dst"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
}

# git
echo "--- git ---"
link_dotfiles "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link_dotfiles "DOTFILES_DIR/git/work.config" "$HOME/.config/git/work.config"
link_dotfiles "$DOTFILES_DIR/git/gitignore" "$HOME/.gitignore"
printf '\n'

# zed
echo "--- zed ---"
link_dotfiles "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
link_dotfiles "$DOTFILES_DIR/zed/keymap.json" "$HOME/.config/zed/keymap.json"
printf '\n'
