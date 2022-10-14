#!/bin/bash
set -eou pipefail

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
    # This checks the system PATH for poetry
    if [[ $(type -P poetry) ]]; then
        echo -e "Poetry is already installed on the system\n"
    else
        echo "Poetry is not installed."
        echo -e "Installing poetry from https://python-poetry.org/docs/ \n"
        # I use Git bash but this can be updated for other terminal environments as well.
        curl -sSL https://install.python-poetry.org | python -
    fi

    msg "Installing poetry environment based on the template pyproject.toml file"
    poetry add \
        flake8@^5 \
        isort@^5.5 \
        black@^22.9 \
        pre-commit@^2.20 \
        --dev
    poetry install
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
