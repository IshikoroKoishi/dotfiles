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

if [ -z "$TERM_PROGRAM" ]; then
    export CURRENT_TERMINAL='other'
else
    if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
        export CURRENT_TERMINAL='iTerm'
    elif [ "$TERM_PROGRAM" = "vscode" ]; then
        export CURRENT_TERMINAL='vscode'
    else
        export CURRENT_TERMINAL='other'
    fi
fi
