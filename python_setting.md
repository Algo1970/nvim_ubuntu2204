
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


### install miniconda

https://docs.conda.io/en/latest/miniconda.html

```
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
```
