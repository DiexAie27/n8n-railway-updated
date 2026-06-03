FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache curl unzip \ 
    && curl https://rclone.org/install.sh | sh

USER node
