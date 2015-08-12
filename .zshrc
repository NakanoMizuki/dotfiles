function precmd() {
PROMPT="%{${fg[yellow]}%}%n%{${fg[white]}%} %~%{${reset_color}%}"
color=`get-branch-status`
PROMPT+="%{$color%}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \[\1\]/')%b%{${reset_color}%}
"
}

function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}

# }}}

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ビープを鳴らさない
setopt nobeep

# 色を使う
autoload -U colors; colors

# 日本語のファイル名を表示可能
setopt print_eight_bit

# 履歴
## ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups


# 補完
## 自動補完を有効にする
autoload -U compinit; compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
## sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

## ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/nakanomizuki/.gvm/bin/gvm-init.sh" ]] && source "/Users/nakanomizuki/.gvm/bin/gvm-init.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
