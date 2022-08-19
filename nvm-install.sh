#!/bin/sh
# 先更新下curl和系统
yum update curl nss nss-util nspr
# 使用wget安装
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
cat >> .bash_profile << EOF
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF
# 注意 这时你需要新开一个终端nvm命令才会生效