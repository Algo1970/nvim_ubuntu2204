## neovim設定 (2023.01.09)

ref : https://zenn.dev/botamotch/articles/4ef893e0d4cd40
ref : https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package

### install nvim

ref : https://linux.how2shout.com/3-ways-to-install-neovim-on-ubuntu-22-04-or-20-04/

```
# install neovim by snap
sudo snap install nvim --classic

# install neovim by AppImage
# sudo apt remove neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
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

### build nvim

https://github.com/neovim/neovim/wiki/Building-Neovim
```
sudo apt-get install ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

```

### plugin manager

- Packerに変更
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

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

### Error対応

- まずは`:checkhealth()`
- ファイル形式によってエラーが出る場合、`:TSInstall 言語名`を試してみる！
