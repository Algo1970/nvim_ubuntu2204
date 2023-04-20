## neovim設定 (2023.01.09)

ref : https://zenn.dev/botamotch/articles/4ef893e0d4cd40

### install nvim

```
# install neovim by AppImage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim


# install nvim (Neovim 0.8.3)
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz

# add .bashrc
export PATH=$PATH:$HOME/nvim-linux64/bin


# alternative  (Neovim v0.7.2)
sudo apt install software-properties-common
sudo apt update
sudo apt install neovim
```

### plugin manager

- Packerに変更

- 便利なプラグイン：https://zenn.dev/kawarimidoll/articles/8172a4c29a6653

### Language Server Protocol(LSP)

- 'neovim/nvim-lspconfig'に変更
- 
ref :nvim-lsp-installerからmason.nvimへ移行する https://zenn.dev/kawarimidoll/articles/367b78f7740e84
ref :Neovimのすゝめ – LSPをセットアップ（Builtin LSP編）  https://wonwon-eater.com/nvim-susume-builtin-lsp/

### install cargo tree-sitter-cli

```
sudo apt install -y cargo
# export PATH=$PATH:$HOME/.cargo/bin
cargo install tree-sitter-cli
```

### wsl2 clipboard setting

- https://sekisuiseien.com/computer/11775/
