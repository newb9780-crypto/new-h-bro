FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    wget \
    gcc \
    libffi-dev \
    ffmpeg \
    aria2 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/

WORKDIR /app/

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    python3 -m pip install -U yt-dlp

EXPOSE 10000

CMD ["python3", "main.py"]
