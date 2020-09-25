# nginx_proxy_docker
An nginx proxy support https based on docker

# clone this repositories 
git clone https://github.com/yadoudou/nginx_proxy_docker.git

# build image
 docker build -t nginx:proxy_1.17.4 .
 
# run it
docker run -d -p 8888:8888 -v /path/to/nginx_proxy_docker/nginx.conf:/etc/nginx/nginx.conf nginx:proxy_1.17.4

# test it
curl https://www.baidu.com -v -x 127.0.0.1:8888


# load imags:
从文件载入镜像可以使用Docker load命令。

命令格式：
docker load --input 文件
或者
docker load < 文件名
此时会导入镜像以及相关的元数据信息等。

# 安装docker
0x02 安装
参考文章 在Ubuntu上安装Docker

安装需要的包
$ sudo apt-get update

安装 apt 依赖包，用于通过HTTPS来获取仓库
$ sudo apt-get install \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg-agent \
   software-properties-common

添加 Docker 的官方 GPG 密钥
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

设置稳定版仓库
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

安装 Docker-ce
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

设置开机自启动并启动 Docker-ce
安装成功后默认开启，可忽略该步骤
测试运行
sudo docker run hello-world
1
添加当前用户到 docker 用户组
# 列出自己的用户组，确认自己在不在 docker 组中
groups
# 没有则新增docker组
sudo groupadd docker
# 把当前用户加入到docker组中
sudo gpasswd -a ${USER} docker
# 重启docker服务
sudo service docker restart

如果仍然无法直接使用docker命令，注销当前用户重新登陆即可，如果仍无法使用，建议重启。

0x03 结束语
完成后，即可在虚拟机使用docker，终于可以开始docker之旅了
