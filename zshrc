if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

eval "$(anyenv init -)"
ß