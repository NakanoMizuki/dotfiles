" プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
if filereadable($HOME . '.vimrc.proxy')
  source $HOME/.vimrc.local
endif

set runtimepath+=~/dotfiles/
runtime! vim-setting/basic.vim
runtime! vim-setting/plugins.vim
runtime! vim-setting/plugins/*.vim
runtime! vim-setting/color.vim
runtime! vim-setting/mapping.vim
