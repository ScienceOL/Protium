#!/bin/bash

# =============================================
# 开发环境启动脚本
# =============================================
# 显示品牌

# 导入颜色配置
SCRIPT_DIR=$(dirname "$0")
source "${SCRIPT_DIR}/branch.sh" && print_icon
source "${SCRIPT_DIR}/colors.sh"

# 严格模式：遇到错误立即退出脚本
set -e

# =============================================
# 环境预检与配置
# =============================================
echo -e "${BRIGHT_MAGENTA}\n⚙  检查 Docker 环境...${RESET}"
if ! command -v docker &> /dev/null; then
  echo -e "${BRIGHT_RED}❌ 错误：未检测到 Docker 安装${RESET}"
  exit 1
fi
echo -e "${BRIGHT_GREEN}✓ Docker 已就绪${RESET}"

# =============================================
# Docker Compose 配置预览
# =============================================
echo -e "${BRIGHT_CYAN}\n🔧 合并 Docker Compose 配置...${RESET}"
echo -e "${YELLOW}══════════════════════════════════════════${RESET}"
docker compose -f docker-compose/docker-compose.base.yaml -f docker-compose/docker-compose.prod.yaml config
echo -e "${YELLOW}══════════════════════════════════════════${RESET}"

# =============================================
# 容器启动
# =============================================
echo -e "${BRIGHT_BLUE}\n🚀 构建 prod 容器服务...${RESET}"
docker compose -f docker-compose/docker-compose.base.yaml -f docker-compose/docker-compose.prod.yaml up --build

echo -e "\n${BRIGHT_GREEN}✅ prod 环境已成功启动！${RESET}"