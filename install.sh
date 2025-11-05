#!/bin/bash

if command -v git >/dev/null 2>&1; then
    echo "Git is already installed."
else
    echo "Git is not installed. Installing Git..."
    if [ -f /etc/arch-release ]; then
        sudo pacman -Sy && sudo pacman -S git --noconfirm
    fi
fi

if [[ $? -eq 0 && $EUID -ne 0 ]]; then
    cp -v .gitconfig ~/
else
    echo "Please run the script as a non-root user to copy the .gitconfig file."
fi
