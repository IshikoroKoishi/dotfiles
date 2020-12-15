# .zshenv
if [ "$(uname)" = 'Darwin' ]; then
    export CURRENT_PLATFORM='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    export CURRENT_PLATFORM='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" = 'MINGW32_NT' ]; then                                                                                           
    export CURRENT_PLATFORM='Cygwin'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

export PERCOL=fzf
