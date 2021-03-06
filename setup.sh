#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing Glide for Darwin.\n"

    which -s brew
    if [[ $? != 0 ]] ; then
        echo "Installing via curl && shell.\n"
        curl https://glide.sh/get | sh
    else
        echo "Brew detected, installing via 'brew install glide'."
        brew update
        brew install glide
    fi
    echo "Installing jet cli."
    brew cask install jet
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "Installing Glide for Linux."
    # This needs testing... I'll be doing that later today.
    sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update
    sudo apt-get install glide
    # Install jet build engine? See > https://github.com/Adron/datadiluvium/issues/17
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    echo "Windows detected, sorry. You're on your own. Cheers!"
    # Helpz! Anybody want to test out an installation and get this working on Windows?
    # Add glide > https://github.com/Adron/datadiluvium/issues/19
    # Add jet cli > https://github.com/Adron/datadiluvium/issues/18
fi

glide install
