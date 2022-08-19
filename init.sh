#!/usr/bin
#  1. 配置 基础前端环境 git|node|pm2 环境
#  1.1 安装nvm 参考nvm-install.sh脚本
#  1.2 安装node
nvm use stable
#  1.3 安装pm2
npm install pm2 -g
#  2. 搭建 kkb-down-core 运行环境：ffmpeg 安装
#  2.1 安装依赖包
wget http://www.ffmpeg.org/releases/ffmpeg-3.1.tar.gz
tar -zxvf ffmpeg-3.1.tar.gz  -C ../
cd ../ffmpeg-3.1
#  2.1.1 先安装前置依赖yasm
wget http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar -zxvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure && make && make install
# 2.1.2 进行编译ffmpeg
./configure --prefix=/usr/local/ffmpeg --enable-shared --disable-debug  --disable-doc --enable-avresample --enable-nonfree --enable-gpl \
--enable-openssl  --disable-avcodec  --disable-swresample --disable-avfilter 
make && make install
#  2.2 添加环境变量
echo "export PATH=$PATH:/usr/local/ffmpeg/bin" >> /etc/profile
source /etc/profile
#  3. 下拉 kkb-down-serve 仓库、安装依赖并 pm2 启动
cd ../down-serve-deploy
git clone git@github.com:Sympath/download-serve.git
cd download-serve
npm install
pm2 delete down-serve
pm2 start bin/www --name down-serve
# 成功后展示pm2应用列表
pm2 list