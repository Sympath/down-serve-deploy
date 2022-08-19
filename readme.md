## 使用指南

服务器快速部署能力 ==》 支持一个初始化的 linux 服务器直接执行脚本自动搭建 kkb-down-serve，及 kkb-down-core 运行环境
适用于：centos

1. 在服务器上下拉对应仓库
2. 执行初始化脚本进行搭建

```
git clone git@github.com:Sympath/down-serve-deploy.git
cd down-serve-deploy
sudo chmod 777 init.sh && nohup sh ./init.sh &
```

查看日志

```
cat down-serve-deploy/nohup.out
```
