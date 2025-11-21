# Render deployment (FastAPI + Streamlit)

This folder is a deployment-ready bundle for Render. It contains the FastAPI backend, Streamlit frontend, required data files, fonts, `requirements.txt`, `.env.example`, and a `render.yaml` blueprint that provisions both services.

## How to use this folder
- Make this folder the root of a new Git repo (or point Render's root directory to `render_deploy` if you keep the rest of the project).
- Review `.env.example` and set your own values (especially `API_URL` for the frontend). Never commit secrets.
- Connect the repo to Render using the Blueprint deploy flow and select `render.yaml`. It defines two web services: `casecheck-api` (FastAPI) and `casecheck-web` (Streamlit).
- After the API service comes up, copy its external URL into the `API_URL` env var of the `casecheck-web` service if it differs from the default `https://casecheck-api.onrender.com`.
- The API service mounts a persistent disk at `data/models` so the BGE-M3 model (~2GB) is downloaded only once. Use at least a Starter-sized instance to avoid memory/timeouts.

## Local smoke test
```bash
pip install -r requirements.txt
uvicorn src.api.main:app --host 0.0.0.0 --port 8000
# in a new shell
API_URL=http://127.0.0.1:8000 streamlit run src/web/app.py --server.address 0.0.0.0 --server.port 8501
```

## Notes
- Data seeds (`data/database/cases.db` and `data/database/vectors`) ship with the bundle; fonts live in `font/`.
- Logs go to `data/logs/` (ignored by git). Model downloads are cached under `data/models` on the mounted disk.
- Update `render.yaml` service names/domains if you change the Render service names; keep `PYTHONPATH=/opt/render/project/src` so imports resolve correctly.
