#!/bin/bash

clear

#必须用root
if [[ $EUID != 0 ]];then
echo -e "\033[31m root用户才能用\033[0m\n"
exit
else
echo -e "\033[36m 你好旅行者 为你祈祷..\033[0m\n"
fi

# 判断当前系统是否为Ubuntu系统
if [[ "$(cat /etc/issue)" =~ "Ubuntu" ]]; then
  clear
else
  echo -e "\e[1;31m不支持当前系统\e[0m"
  echo -e "\e[1;32m请使用 Ubuntu 系统\e[0m"
  exit
fi

# 获取当前系统Python3的版本号
python_version=$(python3 -c "import sys;print(sys.version_info.major*100+sys.version_info.minor)")

# 判断版本是否大于或等于3.7.0
if [ $python_version -ge 307 ]; then
  echo -e "\e[1;32m当前Python3版本 $python_version 开始安装所需环境\e[0m"

apt update
  
# 判断是否已经安装 pipx
if ! command -v pipx &> /dev/null; then
    apt-get install pipx -y
    pipx ensurepath
    source ~/.bashrc
    source ~/.profile
fi

# 判断是否已经安装 python3-pip
if ! command -v pip3 &> /dev/null; then
    apt-get install python3-pip -y
fi

# 升级 pip
pip3 install --upgrade pip

else
  echo "当前Python3版本 $python_version "
  echo -e "\e[1;32m请先安装 Python 3.8+\e[0m"
  echo -e "\e[1;33m但需在3.8-3.10 不要高于3.10\e[0m"
  exit
fi

clear

echo -e "\e[1;33m 安装 NoneBot 脚手架\e[0m"
pipx install nb-cli
echo -e "\e[1;33m 安装小派蒙脚手架插件\e[0m"
nb self install nb-cli-plugin-littlepaimon

clear
echo -e "\e[1;32m 创建小派蒙项目\e[0m"

while true; do
    read -p "请输入路径（绝对路径，默认为/home）：" path
    path=${path:-/home}  # 如果用户没有输入路径，则默认为/home

    if [ -d "$path" ]; then  # 判断路径是否存在
        cd "$path"
        nb paimon create   # 创建项目
        break  # 跳出循环
    else
        echo -e "\e[1;31m路径 $path 不存在，请重新输入\e[0m"
    fi
done

echo -e "\e[1;36m 少女为你痛哭...\e[0m"

exit




