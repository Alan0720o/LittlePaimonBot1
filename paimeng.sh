#!/bin/bash
sudo -i  # 获取root权限，如果本来就以root权限登录，那可以跳过
apt update && apt upgrade  # 更新系统
apt install pipx  # 安装pipx
pipx install nb-cli  # 安装nonebot脚手架
nb self install nb-cli-plugin-littlepaimon  # 安装小派蒙脚手架插件
nb paimon create  # 创建小派蒙项目
pipx install nb-cli  # 安装nonebot脚手架
nb self install nb-cli-plugin-littlepaimon  # 安装小派蒙脚手架插件
nb paimon create  # 创建小派蒙项目
cd LittlePaimon  # LittlePaimon为你刚刚填写的项目目录名
nb paimon res  # 给出的两次选择均保持默认(回车两次)
nb paimon run playwright install chromium --with-deps  # 安装playwright相关依赖

    此后，你只需要在派蒙的目录下使用命令nb paimon run即可启动小派蒙Bot，并根据你选择的go-cqhttp方式，启动并登录机器人账号。"
