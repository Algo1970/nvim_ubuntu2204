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

