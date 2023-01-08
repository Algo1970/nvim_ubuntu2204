### Vagrant introduction

### install vagrant

- 公式サイト:https://www.vagrantup.com/downloads

### vagrant sample

- コマンドプロンプト(cmd)でサンプルフォルダに移動
```
$ cd C:\vagrant\training
```
- 初期化コマンド
```
vagrant init
```
- Vagrantfileを以下に書き換え
```
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "training"
    vb.gui = false
    vb.memory = "2048"
  # config.vm.synced_folder "/Vagrant/workspace", "/home/vagrant/local_workspace/",create:"true"
  end
  config.ssh.private_key_path = "c:/Users/user_name/.vagrant.d/insecure_private_key"
  config.ssh.insert_key = false
  if Object.const_defined? 'VagrantVbguest'
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end
end
```
- `user_name`に自分のアカウント名を入れ忘れないように！！

- vagrantの起動
```
vagrant up
vagrant up --provision
```

- vagrantに接続

```
vagrant ssh
```

- vagrantからのログアウト
```
exit
```

- 仮想マシンのstatus
```
vagrant status
vagrant global-status
```

- 仮想マシンの停止
```
vagrant halt
vagrant halt <id>
```

- 仮想マシンの削除
```
vagrant destroy
vagrant destroy <id>
```

- シェルスクリプト追加

```
  config.vm.provision "shell", inline: <<-SHELL
    echo "hello world!"
  SHELL
```
`config.vm.provision`を追加したあとは、`vagrant provision`もしくは`vagrant up --provision`で起動する

上記スクリプトはrootユーザーで実行されてしまう。一般ユーザー（vagrant）で実行したほうが便利な場合は、`privileged: false`をつける。
```
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo "hello world!"
  SHELL
```


### ディレクトリの共有

以下をvagrantfileに記載
```
config.vm.synced_folder "/Vagrant/workspace", "/home/vagrant/local_workspace/",create:"true"
```

### provisionのmkdirでエラー？

sudo mkdirで実行できたようだ


### ref

- 【Linux環境構築】VagrantとVirtualBoxとは？使い方を初心者向けに解説！: https://kitsune.blog/linux-environment

- Vagrantを扱うときにハマりがちポイントをまとめてみた: https://qiita.com/srockstyle/items/233ef326a75362200a91

- vagrant command一覧: https://qiita.com/oreo3@github/items/4054a4120ccc249676d9

- Vagrant 事始め 05 - 共有フォルダを設定する: https://qiita.com/centipede/items/5b3cb4965618993cefec

- vagrantとホストでファイル共有をする方法: https://nishimemo.com/archives/235

- vagrantガイド: https://docs.ansible.com/ansible/2.9_ja/scenario_guides/guide_vagrant.html

- Vagrant Documentation: https://www.vagrantup.com/docs/index

- 仮想マシンでシェルスクリプト実行: https://maku77.github.io/vagrant/shell-script.html

- Vagrantfileの基本的な書き方: https://note.com/fkeisuke/n/n9259600151c1

- Vagrant Provisioning 一般ユーザーでシェルを実行する方法: https://qiita.com/ucan-lab/items/f2d0c1d13cb0940a358d

- vagrant up時にmkdir -p /vagrantが失敗する: https://qiita.com/EichiSanden/items/68b0ae3d8a98ea60cc3e

- 【Vagrantドキュメント意訳】09.プロビジョニング: https://qiita.com/ringo0321/items/38743442a9abfc3be5b2https://qiita.com/ringo0321/items/38743442a9abfc3be5b2https://qiita.com/ringo0321/items/38743442a9abfc3be5b2

- Vim-plug: コマンドラインから非対話的にPlugInstallを実行: https://bleepcoder.com/ja/nord-vim/255887095/run-pluginstall-non-interactively-from-command-line

- コマンドの途中で聞いてくる yes を自動入力したい？それ yes で出来るよ: https://www.agent-grow.com/self20percent/2018/08/06/linux-command-auto-yes/

- yesコマンドについて詳しくまとめました 【Linuxコマンド集】: https://eng-entrance.com/linux-command-yes
ポートフォワードにより仮想マシン内のサーバにアクセスする: https://maku77.github.io/vagrant/port-forward.html#:~:text=%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AF%E3%83%BC%E3%83%89%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%81%A7%E3%81%AF,%E3%83%9E%E3%82%B7%E3%83%B3%E3%81%B8%E6%8E%A5%E7%B6%9A%E3%81%95%E3%82%8C%E3%81%BE%E3%81%99%E3%80%82

- Vagrantでローカルの仮想マシンにRStudioServer環境を作る: https://qiita.com/kazutan/items/6048fa8d46683dcad788

- neofetch : https://orebibou.com/ja/home/201612/20161205_001/


- fzf : https://qiita.com/kompiro/items/a09c0b44e7c741724c80

- fzf便利な使い方 : https://wonderwall.hatenablog.com/entry/2017/10/06/063000




- vagrant up実行時に「default: Warning: Authentication failure. Retrying...」が連続で出る問題 : https://it-jog.com/khow/vag/vaguperror-ubuntu2204
