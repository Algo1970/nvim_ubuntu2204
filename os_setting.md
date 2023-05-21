## ubuntu22.04 setting

### os setting

- 画面解像度　150％に変更
- mozc　日本語表示切り替えを`Ctrl + space`
 https://blog.kapiecii.com/posts/2020/05/10/ubuntu20-04-mozc-setting/
- ショートカットキー変更
- フォルダ名を英語に変更

```
LANG=C xdg-user-dirs-gtk-update
```
- CapsLock -> Ctrl

```
sudo sed -i -e "s/XKBOPTIONS=\"\"/XKBOPTIONS='ctrl:swapcaps'/g" /etc/default/keyboard 
```

- clipboard setting
```
sudo apt -y install xclip
```

vagrantでコピペは、
https://weblabo.oscasierra.net/vagrant-vbguest-plugin-1/


### app setting

- Alacritty

```
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
sudo apt -y install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install alacritty

```

- Alacritty.yaml `.config/alacritty/alacritty.yaml`
```
font:
  size: 13.0
  
```




- google chrome

```
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' ;\
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ;\
sudo apt update ;\
sudo apt install google-chrome-stable 
```
