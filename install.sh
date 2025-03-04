#!/bin/bash -e

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
