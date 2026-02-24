# Nanobot Telegram Docker  
这是一个预配置的 Nanobot Docker 镜像，已启用 Telegram 支持。  
## 使用方法  
### 环境变量
- `TELEGRAM_TOKEN`: 你的 Telegram Bot Token
- `TELEGRAM_ALLOW_FROM`: 允许的 Telegram User ID  
### 在 Zeabur 上部署
1. 在 Zeabur 中创建新服务
2. 选择 "BUILD_FROM_SOURCE"
3. 连接这个 GitHub 仓库
4. 添加环境变量：  
   - `TELEGRAM_TOKEN`: 你的 Bot Token  
   - `TELEGRAM_ALLOW_FROM`: 你的 User ID
5. 部署  
## 配置  
配置文件位于 `/root/.nanobot/config.json`，已预先配置好 Telegram 支持。  
