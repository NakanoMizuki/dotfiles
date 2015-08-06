" プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
if filereadable($HOME . '.vimrc.proxy')
  source $HOME/.vimrc.local
endif

set runtimepath+=~/dotfiles/
runtime! vim-setting/plugins/*.vim
runtime! vim-setting/*.vim


" ---------------------- カラーテーマ
" カラースキーマの設定
colorscheme jellybeans
" 構文毎に文字色を変化させる
syntax on
" 現在のカーソル行の表示
set cursorline
" カーソル行のアンダーラインを消す
hi clear cursorline
" 現在のカーソル行の数字の色を設定
hi cursorlineNr term=bold ctermfg=red
" ---------------------- カラーテーマ終了
