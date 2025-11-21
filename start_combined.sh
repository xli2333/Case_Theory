#!/bin/bash

# 0. 确保日志目录存在
mkdir -p data/logs

# 1. 在后台启动 FastAPI 后端 (固定端口 8000)
# 使用 & 符号让它在后台运行
# 移除重定向，让日志直接输出到控制台，方便调试
echo "Starting Backend on port 8000..."
uvicorn src.api.main:app --host 127.0.0.1 --port 8000 &

# 等待几秒钟让后端启动
sleep 5

# 2. 在前台启动 Streamlit 前端 (使用 Render 分配的 $PORT)
# 设置 API_URL 为本地回环地址，这样前端直接在容器内部请求后端
echo "Starting Frontend on port $PORT..."
export API_URL="http://127.0.0.1:8000"
streamlit run src/web/app.py --server.port $PORT --server.address 0.0.0.0
