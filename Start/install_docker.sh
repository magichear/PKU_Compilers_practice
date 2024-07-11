#!/bin/sh

# 安装包列表及依赖项
sudo apt update
sudo apt install software-properties-common curl apt-transport-https ca-certificates -y

# 添加 Docker 的 GPG 签名密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg

# 将 Docker 官方存储库添加到系统中
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 安装 Docker 和其他 Docker 工具
sudo apt install docker-ce docker-ce-cli containerd.io uidmap -y

# 将当前用户添加到 Docker 组
sudo usermod -aG docker $USER
newgrp docker

# 验证 Docker 是否正在运行
sudo systemctl status docker

# 安装 Docker Desktop
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.15.0-amd64.deb
sudo apt install ./docker-desktop-*-amd64.deb
