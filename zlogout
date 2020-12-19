if builtin command -v tmux >/dev/null; then
    if [[ -n "$TMUX" ]]; then
        tmux detach
    fi
fi

