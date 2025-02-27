#!/bin/bash

# 生成斜体Science OL大标题
function print_icon() {
  local ITALIC="\033[3m"
  local RESET="\033[0m"
  
  echo -e "${ITALIC}"
  echo '     _____     _             _        ___  _      '
  echo '    / ____|   (_)           | |      / _ \| |     '
  echo '   | (___   ___ _ __   ___  | |     | | | | |     '
  echo '    \___ \ / _ \  _ \ / _ \ | |     | | | | |     '
  echo '    ____) |  __/ | | |  __/ | |____ | |_| | |____ '
  echo '   |_____/ \___|_| |_|\___| |______(_)___/|______|'
  echo -e "${RESET}"
}

# 直接执行时显示图标
if [[ "$0" == *"icon.sh" ]]; then
  print_icon
fi