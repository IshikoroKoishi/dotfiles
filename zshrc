if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
    zcompile ~/.zshrc
fi

eval "$(anyenv init -)"

PROMPT='%F{green}%n@%m%f
%F{blue}%~%f$ '
RPROMPT='%*'
