if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi

path=($path $HOME/.local/bin(N-/) $HOME/.anyenv/bin(N-/))
export PIPENV_VENV_IN_PROJECT=1

source "$HOME/.cargo/env"
