# tmux自動起動
if builtin command -v tmux >/dev/null; then
  if [[ ! -n "$TMUX" ]]; then
      ID="$(tmux list-sessions)"
    if [[ -z "$ID" ]]; then
        tmux new-session
    else
        create_new_session="Create New Session"
        ID="$ID\n${create_new_session}:"
        ID="$(echo $ID | fzf | cut -d: -f1)"
        if [[ "$ID" = "${create_new_session}" ]]; then
            tmux new-session
        elif [[ -n "$ID" ]]; then
            tmux attach-session -t "$ID"
        else
            :
        fi
    fi
  fi
fi

# 最初の一画面のみOS情報を表示
if [[ `tmux list-windows | wc -l | xargs echo` = "1" ]]; then
    if [[ `tmux list-panes | wc -l | xargs echo` = "1" ]]; then
        neofetch
    fi
fi

echo ".zlogin loaded"
