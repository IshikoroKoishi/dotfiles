# .zshrc

# zplugをロード
source ~/.zplug/init.zsh

# ダブルクォーテーションで囲うと良い
zplug "zsh-users/zsh-history-substring-search"

# コマンドも管理する
# グロブを受け付ける（ブレースやワイルドカードなど）
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# こんな使い方もある（他人の zshrc）
zplug "tcnksm/docker-alias", use:zshrc

# frozen タグが設定されているとアップデートされない
zplug "k4rthik/git-cal", as:command, frozen:1

# GitHub Releases からインストールする
# また、コマンドは rename-to でリネームできる
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# oh-my-zsh をサービスと見なして、
# そこからインストールする
zplug "plugins/git",   from:oh-my-zsh

# if タグが true のときのみインストールされる
if [[ $CURRENT_PLATFORM = "Mac" ]]; then
    zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

    # prezto のプラグインやテーマを使用する
    zplug "modules/osx", from:prezto, if:"[[ $OSTYPE == *darwin* ]]"
    zplug "modules/prompt", from:prezto
    # zstyle は zplug load の前に設定する
    zstyle ':prezto:module:prompt' theme 'sorin'
fi

# インストール・アップデート後に実行されるフック
# この場合は以下のような設定が別途必要
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# リビジョンロック機能を持つ
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Gist ファイルもインストールできる
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh

# bitbucket も
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# `use` タグでキャプチャした文字列でリネームする
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# 依存管理
# "emoji-cli" は "jq" があるときにのみ読み込まれる
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
# ノート: 読み込み順序を遅らせるなら defer タグを使いましょう

# 読み込み順序を設定する
# 例: "zsh-syntax-highlighting" は compinit の後に読み込まれる必要がある
# （2 以上は compinit 後に読み込まれるようになる）
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ローカルプラグインも読み込める
zplug "~/.zsh", from:local

# テーマファイルを読み込む
zplug 'dracula/zsh', as:theme

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインを読み込む
zplug load

# Powerline-goを設定
function powerline_precmd() {
    eval "$(powerline-go -error $? -shell zsh -eval -modules-right time)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
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
