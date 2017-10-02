#!/bin/bash
echo "root用户仅适用于Debian及其分支"
echo "非root用户理论适用于所有Linux"
echo "-----------------------------------------------------"
echo "选择操作用户"
echo "1.root"
echo "2.其他"
echo "键入数字并enter"
read aNum
case $aNum in
         1) apt-get install -y curl git-core ; curl -sL https://deb.nodesource.com/setup_6.x | bash - ; apt-get install -y nodejs
         ;;
         2) sudo apt-get install -y curl git-core ; curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash ; nvm install stable
         ;;
esac
echo "在中国大陆吗？"
echo "1.是"
echo "2.否"
echo "键入并按Enter"
read where
case $where in
         1) npm config set registry https://registry.npm.taobao.org ; npm install -g hexo-cli
          ;;
         2) npm install -g hexo-cli
          ;;
esac
echo "输入Hexo初始化目录"
read inputdir
mkdir $inputdir ; cd $inputdir ; hexo init
echo `date`
echo "安装完成,再见,script by Copyright³(unstartdev)" | exit 0
