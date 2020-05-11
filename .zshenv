# Nodebrew
export NODE_BREW=$HOME/.nodebrew/current

# ライブラリを含める
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

# Pythonライブラリにpip3で入れたものを含める
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.6/site-packages/

# GO
export GOPATH=$(go env GOPATH)

# PATH の内容と同期している配列変数 path も使える
path=(
  ~/bin
  $path
  $NODE_BREW/bin
  $GOPATH/bin
  $path
)
