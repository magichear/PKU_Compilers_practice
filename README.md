# PKU_Compilers_practice

PKU 的编译原理实践实验

## 问题

### Docker 的安装

这里尝试了 Windows 与 Linux 两个系统的方案

- 虚拟机（ubuntu-22.04.4-desktop-amd64.iso）

  - 共尝试了两种方案，均在`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`步骤无法连接

        错误:5 https://download.docker.com/linux/ubuntu jammy InRelease

        无法发起与
        download.docker.com:443 (2a03:2880:f112:83:face:b00c:0:25de)
        的连接 - connect (101: 网络不可达)
        无法连接上 download.docker.com:443 (199.96.63.75)，连接超时

  - 我的虚拟机上没有魔法，不确定是宿主机的魔法不能提供给虚拟机还是单纯的连不上（宿主机上同时可以使用魔法进行下载）

- Windows11
  - 直接下载`exe`然后双击安装即可，安装包`400M`，整个安装完大概`2G`
  - 安装重启并运行之后提示`Docker Desktop - WSL update failed`
    - 懒得再查是不是`WSL`的原因了，遂卸载

---

上述步骤无法安装之后，想起之前使用学校`vlab`的虚拟机安装过，尝试拉包与读取根目录成功

下面是详细的配置下载源与安装步骤

```sh
#!/bin/sh
# 安装docker
sudo apt install docker.io

# 配置阿里镜像源
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://yxzrazem.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# 拉取dev

```

### 基本操作

命令前一般都需要加上`sudo`

- 为某个`dev`创建一个新的容器并执行一条命令

  ```bash
  sudo docker run maxxing/compiler-dev ls -l /
  ```

- 查看所有容器信息

  ```bash
  sudo docker ps -a
  ```

- 删除某容器（假设 ID 为 12345）

  ```bash
  sudo docker rm 12345
  ```

- 使用`dev`已有的容器执行相同的命令

  ```bash
  sudo docker run --rm maxxing/compiler-dev ls -l /
  ```

- 打开容器的`bash`

  ```bash
  sudo docker run -it --rm maxxing/compiler-dev bash
  ```

  - 退出： 执行`exit`或按下`ctrl D`
  - `--rm`选项会在退出后删除刚才的容器
  - `-i`参数为`输入`
  - `-t`参数为`分配终端`

- 文件共享
  ```bash
  sudo docker run -it --rm -v /home/zxy/compiler:/root/compiler maxxing/compiler-dev bash
  ```
  - 将宿主机的`/home/zxy/compiler`目录挂载到容器的`/root/compiler`下
