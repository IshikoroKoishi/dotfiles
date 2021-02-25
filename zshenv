if [ ~/.zshenv -nt ~/.zshenv.zwc ]; then
    zcompile ~/.zshenv
fi

path=($path $HOME/.local/bin(N-/) $HOME/.anyenv/bin(N-/))

source "$HOME/.cargo/env"
