
## python setting

### nvim

- pynvim:Pynvim は、Nvim で Python プラグインのサポートを実装します。また、msgpack-rpc API を介して Nvim プロセスに接続し、スクリプトを作成するためのライブラリとしても機能します。
https://github.com/neovim/pynvim

```
sudo apt install python3-pip
pip3 install pynvim
pip3 install -U pynvim
sudo apt install python3.10-venv   # python-lsp-severをMassonでインストールするにも必要
```

`init.lua`に追加
```
vim.cmd 'let g:python3_host_prog = "/usr/bin/python3"'
```

### python環境構築
```
sudo apt install pipenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```
pathの設定
```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

bash_profileを適用

`source ~/.bash_profile`
