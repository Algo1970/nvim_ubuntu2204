## neovim設定 (2023.01.09)

ref : https://zenn.dev/botamotch/articles/4ef893e0d4cd40

### install nvim

```
# install nvim (Neovim 0.8.3)
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz

# add .bashrc
export PATH=$PATH:$HOME/nvim-linux64/bin
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
