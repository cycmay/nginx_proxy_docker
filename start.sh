#!/bin/bash

# 安装docker
sudo apt-get update
sudo apt-get install \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo "docker installed\n"
echo "load images > \n"
docker load --input proxy_1.17.4.tar
docker load --input centos_7.tar
docker run -d -p 8888:8888 -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf nginx:proxy_1.17.4
echo "completed!\n"
echo "test:\n"
curl https://www.baidu.com -v -x 127.0.0.1:8888
