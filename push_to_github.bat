# Windows 上传指南

# 1. 打开命令提示符 (CMD) 或 PowerShell
# 2. 进入 render_deploy 文件夹
cd render_deploy

# 3. 初始化 Git (如果你是第一次)
git init

# 4. 添加你的远程仓库 (把 <YOUR_REPO_URL> 换成你的 GitHub 地址)
# 例如: git remote add origin https://github.com/xli2333/Case_Theory.git
git remote add origin https://github.com/xli2333/Case_Theory.git

# 5. 添加所有文件
git add .

# 6. 提交
git commit -m "Deploy to Render"

# 7. 强制推送到远程仓库 (覆盖原有内容)
git push -f origin master
