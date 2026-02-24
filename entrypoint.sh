#!/bin/bash  
set -e  
# 更新 Telegram 配置  
if [ -n "$TELEGRAM_TOKEN" ]; then  
  python3 << 'PYTHON'  
import json  
import os  
config_path = '/root/.nanobot/config.json'  
with open(config_path, 'r') as f:  
    config = json.load(f)  
config['channels']['telegram']['token'] = os.environ.get('TELEGRAM_TOKEN', '')  
if os.environ.get('TELEGRAM_ALLOW_FROM'):  
    config['channels']['telegram']['allowFrom'] = [int(os.environ.get('TELEGRAM_ALLOW_FROM'))]  
with open(config_path, 'w') as f:  
    json.dump(config, f, indent=2)  
PYTHON  
fi  
# 启动 nanobot，使用 echo 处理交互式提示  
(echo "N"; sleep 2) | nanobot || true  
# 如果 nanobot 命令失败，尝试直接启动 Python  
if ! pgrep -f nanobot > /dev/null; then  
  python3 -m nanobot.cli  
fi  
# 保持容器运行  
tail -f /dev/null  
