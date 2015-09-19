dotfiles

自分用の各種設定ファイル

# Mac
## X-codeのインストール
``` sh
sudo xcodebuild -license
```

## Homebrew, ansibleのインストール
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install ansible
```

## パッケージのインストール(Homebrew)
```sh
sh mac-provisioning/provisioning.sh
```

## ドットファイルへのシンボリックリンク作成
```sh
sh link.sh
```

# Windows
```sh
mklink.bat
```
