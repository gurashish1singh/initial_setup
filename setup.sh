#!/bin/bash
set -ou pipefail

PRETTY_LINES=$(printf "=%.0s" {1..100})

msg()
{
    echo $PRETTY_LINES
    echo $1
    echo $PRETTY_LINES
}

setup_poetry()
{
    echo "Checking if poetry is already installed on the system"
    if [[ $(type -P poetry) ]]; then
        echo -e "Poetry is already installed on the system\n"
    else
        echo -e "Installing poetry from https://python-poetry.org/docs/ \n"
        # TODO: This doesn't work for powershell so might need a nested if-block here
        # curl -sSL https://install.python-poetry.org | python -
    fi

    msg "Installing poetry environment based on the existing pyproject.toml file"
    poetry add \
        flake8@^5 \
        isort@^5.5 \
        black@^22.9 \
        pre-commit@^2.20 \
        --dev
    poetry install --no-root
    echo
}

install_hooks()
{
    msg "Installing pre-commit hooks."
    poetry run pre-commit install
    echo
}

msg "Starting project setup"
setup_poetry
install_hooks
msg "Local setup completed!"
