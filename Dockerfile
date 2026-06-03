FROM n8nio/n8n:latest

USER root

RUN curl https://rclone.org/install.sh | sh || \
    wget -qO- https://rclone.org/install.sh | sh

USER node
