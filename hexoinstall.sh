#!/bin/bash
echo "Hexo and Nodejs install script. --by Copyright³"
#判定是否已安装nodejs
node -v >> /dev/null
if [$? -eq 0]
then
    echo "您已安装Nodejs!此脚本不适用！“
    exit 0
fi
#判定是否为based on Debian系统，简陋(
apt-get moo >> /dev/null
if [$? -eq 0]
then
    $user=`whoami`
#判定是否为root用户，有两种不同方法
elif [$user == root]
then
    apt-get install -y sudo >> /dev/null;
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - >> /dev/null
    sudo apt-get install -y nodejs >> /dev/null | echo "正安装Nodejs/Installing nodejs"
elif [$user != root]
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash >> /dev/null;echo "已使用nvm安装Nodejs！“
    source .bashrc
    source /etc/profile
else
    exit 0
fi
npm -v >> /dev/null
if [$? != 0]
then
    echo "Error...遇到未知错误！"
    exit 0
fi
apt-get install libc++ -y >> /dev/null
#解决依赖问题
echo "选择你所在的地区“
echo "1.国内(China)"
echo "2.国外(Other)"
read aNum
case $aNum in
    1) npm config set registry https://registry.npm.taobao.org
    ;;
esac
sudo apt-get install cy git-core >> /dev/null
npm install -g hexo-cli;echo "[INFO] Hexo已成功安装，祝你愉快，再见！";echo `date`
exit 0
