
## python setting

### nvim

- pynvim:Pynvim は、Nvim で Python プラグインのサポートを実装します。また、msgpack-rpc API を介して Nvim プロセスに接続し、スクリプトを作成するためのライブラリとしても機能します。
https://github.com/neovim/pynvim

```
sudo apt install python3-pip
pip3 install pynvim
pip3 install -U pynvim
```

`init.lua`に追加
```
vim.cmd 'let g:python3_host_prog = "/usr/bin/python3"'
```
