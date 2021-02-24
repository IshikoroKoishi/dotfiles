if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi

export PATH=$PATH:$HOME/.local/bin

source "$HOME/.cargo/env"
