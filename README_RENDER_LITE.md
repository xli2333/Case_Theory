# Render 部署指南 (省钱版 - $8.5/月)

本指南使用 "All-in-One" 模式，在一个 Render 服务中同时运行前端和后端，最大程度节省成本。

## 部署步骤

1.  **准备代码库**
    *   确保你的 `render_deploy` 文件夹是 Git 仓库的根目录，或者将 `render_deploy` 内的所有文件复制到项目根目录并推送到 GitHub。

2.  **创建服务 (Render Blueprint)**
    *   在 [Render Dashboard](https://dashboard.render.com/) 点击 **New +** -> **Blueprint**。
    *   连接你的 GitHub 仓库。
    *   Render 会自动识别 `render.yaml`。
    *   你只会看到**一个**服务 `casecheck-app` 和一个磁盘 `casecheck-model-cache`。
    *   点击 **Apply**。

3.  **等待部署**
    *   Render 会自动安装依赖并启动。
    *   首次启动可能需要 5-10 分钟下载 AI 模型 (BGE-M3)，请耐心等待。

## 费用说明
*   **Web Service (Starter)**: $7/月 (必须使用 Starter，因为 Free 版内存太小，无法运行 AI 模型)。
*   **Disk**: $1.5/月 (用于缓存 2GB+ 的 AI 模型，否则每次部署都要重新下载)。
*   **总计**: $8.5/月。

## 常见问题
*   **内存不足**: 如果服务崩溃 (OOM)，说明 BGE-M3 模型占用了超过 512MB 内存。这种情况下，你可能需要升级到 Standard Plan ($25)，或者考虑只在本地运行。
*   **访问地址**: 部署成功后，点击 Render 提供的 URL 即可直接访问网页版。
