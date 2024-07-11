#!/bin/sh
# 配置阿里镜像源
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://ustc-edu-cn.mirror.aliyuncs.com",
                        "https://hub-mirror.c.163.com",
                        "https://yxzrazem.mirror.aliyuncs.com"
                      ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

docker info

# 拉取dev
sudo docker pull maxxing/compiler-dev