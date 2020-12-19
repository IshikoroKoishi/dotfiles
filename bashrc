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

function _update_ps1() {
    eval "$(powerline-go -error $? -eval -modules-right time)"
}

if [ "$TERM" != "linux" ] && builtin command -v tmux >/dev/null; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# anyenvがインストール済みの環境でのみ設定反映
if builtin command -v anyenv >/dev/null; then
  eval "$(anyenv init -)"
fi

# tmux自動起動
if builtin command -v tmux >/dev/null; then
  if [[ ! -n $TMUX ]]; then
    ID="`tmux list-sessions`"
    if [[ -z "$(echo $ID | grep -s $CURRENT_TERMINAL)" ]]; then
      tmux -2u new-session -s $CURRENT_TERMINAL; exit
    else
      tmux -2u attach-session -t $CURRENT_TERMINAL; exit
    fi
  fi
fi
