#!/bin/bash

# 代理打开时设置代理
if [ "$(curl -sL -w '%{http_code}' http://127.0.0.1:7890 -o /dev/null)" != "000" ]; then
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
else
  unset https_proxy
  unset http_proxy
  unset all_proxy
fi

