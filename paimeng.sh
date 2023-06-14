#!/bin/bash
sudo -i  # 获取root权限，如果本来就以root权限登录，那可以跳过
yes | apt update && apt upgrade  # 更新系统
yes | apt install pipx  # 安装pipx
yes | pipx install nb-cli  # 安装nonebot脚手架
yes | nb self install nb-cli-plugin-littlepaimon  # 安装小派蒙脚手架插件
yes | nb paimon create  # 创建小派蒙项目
yes | pipx install nb-cli  # 安装nonebot脚手架
yes | nb self install nb-cli-plugin-littlepaimon  # 安装小派蒙脚手架插件
nb paimon create&&cd LittlePaimon&&nb paimon res&&nb paimon run playwright install chromium --with-deps  # 创建小派蒙项目
cd LittlePaimon  # LittlePaimon为你刚刚填写的项目目录名
yes | nb paimon res  # 给出的两次选择均保持默认(回车两次)
yes | nb paimon run playwright install chromium --with-deps  # 安装playwright相关依赖

    此后，你只需要在派蒙的目录下使用命令nb paimon run即可启动小派蒙Bot，并根据你选择的go-cqhttp方式，启动并登录机器人账号。"
