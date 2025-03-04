# aoba-dotfile

## シンボリックリンクの登録

### シンボリックリンクの追加

#### 一つのファイルを追加する場合

```
cd path/to/aoba-dotfiles
ln -s /absolute/path/to/dotfiles/.zshrc ~/.zshrc
```

#### 一括で追加する場合(新しいマシンにデプロイする時)

```
./install.sh
```

### リンクを確認

```
ls -la ~
```
