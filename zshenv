# .zshenv
if [ "$(uname)" == 'Darwin' ]; then
    CURRENT_PLATFORM='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    CURRENT_PLATFORM='Linux'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then                                                                                           
    CURRENT_PLATFORM='Cygwin'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

export PERCOL=fzf
