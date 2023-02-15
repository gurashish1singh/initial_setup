# Placeholder Project Name


## Initial setup
The bash script **setup.sh** is an executable which needs to be run to setup the local environment. Devs should run
```bash
chmod +x setup.sh
```
(Powershell may have different syntax to set executable permissions) before running
```bash
bash setup.sh
```

The **pyproject.toml** file contains project dependencies and can be updated to add more dependencies at any stage of the project by running `poetry add <packagename>`.
Minimum Python version supported is 3.9.

The **.pre-commit-config.yaml** contains linters that run before commiting.
