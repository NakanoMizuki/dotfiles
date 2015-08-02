" ------------------------プラグイン設定
" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif
" インデントに色を付けて見やすくする
NeoBundle 'nathanelkane/vim-indent-guides'
" Elixir
NeoBundle "elixir-lang/vim-elixir"

" vimrc に記述されたプラグインでインストールされていないものがないかチェック
NeoBundleCheck
call neobundle#end()
filetype plugin indent on


"unite {{{
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}} unite

" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"}}}

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" vim-indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 30
" }}}

" -------------------------プラグイン設定終わり

" 行番号の表示
set number 
" 現在のカーソル位置を表示 
set ruler 
" 対応する括弧やブレースを表示 
set showmatch 
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent 
" タブ文字でなく空白を使う
set expandtab
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,],~
" クリップボードの設定
set clipboard=unnamed,autoselect
" 履歴
set history=2000
" スワップファイルは使わない
set noswapfile
" バックアップファイルを作成しない
set nobackup
" 余計なファイルを作らない
set noundofile
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd


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

" -----------------------マッピング
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <C-h> ^
nnoremap <C-l> $
nnoremap <CR> A<CR><ESC>

inoremap jk <Esc>
" -----------------------マッピング終了
