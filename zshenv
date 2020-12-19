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

export PATH="/usr/local/sbin:$PATH"

if [ -z "$TERM_PROGRAM" ]; then
    export CURRENT_TERMINAL='other'
else
    export CURRENT_TERMINAL="$(echo $TERM_PROGRAM | sed 's/\./_/g')"
fi

if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.anyenv/bin"
