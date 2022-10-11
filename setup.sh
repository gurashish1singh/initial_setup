#!/bin/bash
set -eou pipefail

PRETTY_LINES=$(printf "=%.0s" {1..100})

msg(){
    echo $PRETTY_LINES
    echo $1
    echo $PRETTY_LINES
}

setup_poetry()
{
    echo "Checking if poetry is already installed on the system"
    # Checking if poetry is installed on the user's system.
    if [[ $(type -P poetry) ]]; then
        echo -e "Poetry is already installed on the system\n"
    else
        echo -e "Installing poetry from https://python-poetry.org/docs/ \n"
        # TODO: This doesn't work for powershell so might need a nested if-block here
        # curl -sSL https://install.python-poetry.org | python -
    fi

    msg "Initializing a new poetry project"
    poetry init
    echo
}

install_hooks()
{
    # check for pre-commit in poetry and then install it
    # yaml file will exist in the template but i'll still verify it's existence
    # maybe i will include boilerplate toml file as well?

msg "Starting project setup"
setup_poetry
install_hooks
