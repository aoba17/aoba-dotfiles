#!/bin/bash -e

echo "Install Xcode Command Line Tools."
if ! command -v xcode-select &>/dev/null; then
    xcode-select --install
    echo "Success install Xcode Command Line Tools."
else
    echo "Xcode Command Line Tools already installed."
fi

echo "Install Homebrew."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Success install Homebrew."
else
    echo "Homebrew already installed."
fi

echo "Install Homebrew packages."
if [ -f ~/.Brewfile ]; then
    echo "package install skipped because Brewfile already exists."
else
    brew bundle
    echo "Success install Homebrew packages."
fi

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
done
echo "Success"

echo "Create warp links"
if [ ! -d ~/.warp ]; then
    mkdir ~/.warp
    for warpfile in .warp/*; do
        ln -snfv "$(pwd)/$warpfile" "$HOME/$warpfile"
    done
    echo "Success"
else
    echo ".warp directory already exists."
fi
