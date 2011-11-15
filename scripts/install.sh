#!/bin/sh

if [ -e ~/.vimrc ]; then
    echo "Detected presence of existing configuration..."
    exit 1
fi

# Create the symbolic link
ln -s ~/.vim/vimrc ~/.vimrc

exit 0
