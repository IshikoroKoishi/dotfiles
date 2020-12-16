# 最初の一画面のみOS情報を表示
if [[ `tmux list-windows | wc -l | xargs echo` = "1" ]]; then
    if [[ `tmux list-panes | wc -l | xargs echo` = "1" ]]; then
        neofetch
    fi
fi
