" エンコード指定
set encoding=utf-8
set fileencoding=utf-8
" 行番号の表示
set number
" 現在のカーソル位置を表示
set ruler
set cursorcolumn
set cursorline
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
" 余計なファイルを無視
set wildignore+=*/tmp/**,*.so,*.swp,*.zip,*.jpg,*.png
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 大文字、小文字を区別せずに検索する
set ignorecase
" 大文字のみで検索したときに大文字小文字を区別する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" ステータスラインを表示
set laststatus=2
" スクロール時の余白行数
set scrolloff=5

" 保存時に末尾の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge
