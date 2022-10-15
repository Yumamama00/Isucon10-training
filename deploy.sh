#!/bin/bash

# Git PULL
cd /home/isucon/isuumo
git checkout main
git pull origin main

# goビルド
cd /home/isucon/isuumo/webapp/go
go build

# ハードリンク貼り直し
sudo rm -f /etc/mysql/mysql.conf.d/mysqld.cnf
cd /etc/mysql/mysql.conf.d
sudo ln /home/isucon/isuumo/configs/mysqld.cnf

# サービス再起動
sudo systemctl restart nginx
sudo systemctl restart mysql
sudo systemctl restart isuumo.go

# ログクリア
sudo truncate /var/log/mysql/mysql-slow.log --size 0
sudo truncate /var/log/nginx/access.log --size 0
