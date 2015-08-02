# Maven
export M2_HOME=$HOME/Documents/apache-maven-3.3.3
# Nodebrew
export NODE_BREW=$HOME/.nodebrew/current

# PATH の内容と同期している配列変数 path も使える
path=(
    ~/bin
    $path
)

path=(
  $M2_HOME/bin(N-/)
  $NODE_BREW/bin
  $path
)
