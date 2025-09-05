# ——— Base image ———
FROM python:3.11-slim AS base


ENV PYTHONDONTWRITEBYTECODE=1 \
PYTHONUNBUFFERED=1 \
PIP_NO_CACHE_DIR=1


WORKDIR /app


# (Optional) install system deps if you later add native packages
RUN apt-get update && apt-get install -y --no-install-recommends \
ca-certificates \
&& rm -rf /var/lib/apt/lists/*


# ——— Install Python deps ———
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt


# ——— App code ———
COPY app ./app
COPY gunicorn_conf.py ./


EXPOSE 8000


# ——— Runtime ———
CMD ["gunicorn", "-k", "uvicorn.workers.UvicornWorker", "-c", "gunicorn_conf.py", "app.main:app"]