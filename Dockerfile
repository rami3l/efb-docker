FROM python:3.7-alpine
LABEL maintainer="rami3l@outlook.com"

# ENV TZ "Asia/Shanghai"

COPY requirements.txt .

RUN apk add --no-cache build-base git ffmpeg libmagic libwebp-dev zlib-dev jpeg-dev libjpeg-turbo libffi-dev openssl-dev \
    && pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt \
    && pip install git+https://github.com/milkice233/efb-qq-slave.git \
    && rm -rf ~/.cache

CMD ["ehforwarderbot"]
