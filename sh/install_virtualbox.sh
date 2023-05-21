## install virtualbox
## https://lab4ict.com/system/archives/5648
 
## sudo nvim /etc/apt/sources.list
## 最下行に追記
## deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib

wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
sudo apt update
sudo apt install virtualbox-7.0
