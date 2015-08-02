" フォント指定
set guifont=Ricty\ Diminished\ Regular:h16
" 行、幅設定
set lines=90 columns=150
"暗い背景色用の配色を使う
set background=dark 
"日本語IMEの自動on/offをしない
set imdisable

" IMEが起動している時にカーソルの色を変える
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Purple
endif
