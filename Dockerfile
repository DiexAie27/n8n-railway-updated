FROM n8nio/n8n:latest

USER root

RUN wget -O /tmp/rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    cd /tmp && \
    unzip rclone.zip && \
    mv rclone-*-linux-amd64/rclone /usr/local/bin/ && \
    chmod +x /usr/local/bin/rclone && \
    rm -rf /tmp/rclone* && \
    chown -R node:node /home/node/.n8n 2>/dev/null || true

USER node
