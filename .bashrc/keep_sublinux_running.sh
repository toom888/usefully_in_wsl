#!/bin/bash

# 定义tmux会话名称
SESSION_NAME="keep_sublinux_running"

# 检查是否存在名为SESSION_NAME的tmux会话
tmux has-session -t $SESSION_NAME 2>/dev/null

# 检查上一条命令的退出状态
if [ $? != 0 ]; then
  # 没有找到会话，创建新会话并在其中运行top命令
  # -d 参数确保tmux会话在后台运行（detached）
  # -s 指定会话名称
  # 'top' 是创建会话后要执行的命令
  tmux new-session -d -s $SESSION_NAME 'top'
  echo "创建了新的tmux会话 '$SESSION_NAME' 并在其中运行了top命令。"
#else
#  echo "tmux会话 '$SESSION_NAME' 已存在。"
fi
