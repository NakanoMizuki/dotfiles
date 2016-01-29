" Leaderを設定
let mapleader="\<SPACE>"

nnoremap <Leader>w :w<CR>

" 移動関連
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <C-h> ^
nmap <C-j> %
nnoremap <C-l> $

" 改行
nnoremap <CR> O<ESC><Down>

" 日付の挿入
nnoremap <F6> <ESC>A<C-R>=strftime("%Y-%m-%d (%a) %H:%M")<CR>

cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>

" <ESC>
inoremap jk <Esc>
