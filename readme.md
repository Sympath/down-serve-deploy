## 使用指南

服务器快速部署能力 ==》 支持一个初始化的 linux 服务器直接执行脚本自动搭建 kkb-down-serve，及 kkb-down-core 运行环境
适用于：centos

1. 在服务器上下拉对应仓库
2. 执行初始化脚本进行搭建

### 使用步骤

1. 安装 linux 百度云盘（这个需要获取授权码，所以没法自动化）：sudo chmod 777 ./ && nohup sh ./bypy-install.sh
   （：安装完成后会输出一个地址，访问输出的的地址获取授权码，输入授权码进行验证即可
2. 执行核心脚本：nohup sh ./init.sh

## 常用命令

仓库使用

```
git clone git@github.com:Sympath/down-serve-deploy.git
```

切换进目录

```
cd down-serve-deploy
```

执行脚本

```
rm -rf nohup.out && chmod +x ./init.sh && nohup sh ./init.sh &
```

查看日志

```
cd down-serve-deploy/download-serve/all-kkb/baoshi/ && cat all.log
cat all_err.log
```

查看同名进程

```
ps -ef | grep init.sh | grep -v grep
```

批量杀死同名进程

```
ps -ef | grep init.sh | grep -v grep | awk '{print "kill "$2}' | sh
```
