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
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'itchyny/lightline.vim'
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

NeoBundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0 "Disable default mappings
nmap s <plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_migemo = 1

NeoBundle 'tmhedberg/matchit'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kakkyz81/evervim'

" Elixir
NeoBundle "elixir-lang/vim-elixir"
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" JSON
NeoBundle 'elzr/vim-json'

" プラグインでインストールされていないものがないかチェック
NeoBundleCheck
call neobundle#end()
filetype plugin indent on


" NERDTree {{{
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" }}}

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
let g:indent_guides_color_change_percent = 20
" }}}
