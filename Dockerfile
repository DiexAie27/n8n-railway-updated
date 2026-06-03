FROM n8nio/n8n:latest

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && curl https://rclone.org/install.sh | bash \
    && apt-get clean
USER root
