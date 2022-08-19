#!/usr/bin
#  1. 配置 基础前端环境 git|node|pm2 环境
#  1.1 安装nvm 参考nvm-install.sh脚本
#  1.2 安装node
nvm use stable
#  1.3 安装pm2
npm install pm2 -g
#  2. 搭建 kkb-down-core 运行环境：ffmpeg 安装
# 参考技术文章 https://cloud.tencent.com/developer/article/1985211
# 先安装epel-release 
# https://blog.csdn.net/weixin_41831919/article/details/109035936（：EPEL (Extra Packages for Enterprise Linux)是基于Fedora的一个项目，为“红帽系”的操作系统提供额外的软件包，适用于RHEL、CentOS和Scientific Linux.
yum install epel-release
# 安装nux存储库
rpm -v --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# 现在就安装ffmpeg
yum install ffmpeg ffmpeg-devel
# 验证
ffmpeg -version
#  3. 下拉 kkb-down-serve 仓库、安装依赖并 pm2 启动
cd ../down-serve-deploy
git clone git@github.com:Sympath/download-serve.git
cd download-serve
npm install
pm2 delete down-serve
pm2 start bin/www --name down-serve
# 成功后展示pm2应用列表
pm2 list