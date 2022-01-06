# documentation for using dotfiles and setting up environments

## Info on how to use `pyenv` for managin virtual environments

### starting a new project

1. create a new virtual environment

`pyenv virtualenv [python version (optional)] [name]`

2. put the name of the virtual environment in `.python-version`

`echo [name] >> .python-version`

3. make sure to install required packages

    - `pynvim`

