FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    procps \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

WORKDIR /app

RUN chmod +x utils/novnc_proxy

EXPOSE 6080

CMD ["./utils/novnc_proxy", "--vnc", "10.0.0.94:5901"]

