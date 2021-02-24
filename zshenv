if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi

source "$HOME/.cargo/env"
