sudo ufw status
# inactiveの場合は、enableを引数にして実行
sudo ufw enable
# 実行後はssh接続できなるなる。
# 一度実行すると、再起動後も有効化されたままとなる
# UFWの設定は、/etc/ufw/ufw.conf  or  /etc/ufw/user.rulesなどに保存される
# SSH serverとWeb serverに対するアクセスを許可するには、下記コマンドを実行
# sudo ufw allow "OpenSSh"
# sudo ufw allow "Nginx Full"
# 高度な制御をしたい場合は、Fail2banを使用する
# sudo apt -y install fail2ban

