#!/bin/bash

# 检查sshd服务是否在运行
if ! service ssh status > /dev/null
then
    echo "SSH服务未运行，正在尝试启动..."
    # 尝试启动sshd服务
    sudo service ssh start
    # 再次检查服务是否成功启动
    if service ssh status > /dev/null
    then
        echo "SSH服务已成功启动。"
    else
        echo "启动SSH服务失败，请检查日志以了解原因。"
    fi
# else
#     echo "SSH服务已在运行。"
fi

ssh_connecte_addr=$(ifconfig |grep inet\ |awk '{print $2}'|grep -v 0.1$)
echo -e "sshd server can be conected by follow addr.\n${ssh_connecte_addr}"
