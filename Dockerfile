FROM n8nio/n8n:latest

USER root

ADD https://downloads.rclone.org/rclone-current-linux-amd64.zip /tmp/rclone.zip

RUN cd /tmp && \
    unzip rclone.zip && \
    mv rclone-*-linux-amd64/rclone /usr/local/bin/ && \
    chmod +x /usr/local/bin/rclone && \
    rm -rf /tmp/rclone*

RUN printf '#!/bin/sh\nrclone rcd --rc-no-auth --rc-addr :5572 --config /home/node/.n8n/rclone/rclone.conf &\nexec /docker-entrypoint.sh "$@"\n' > /custom-entrypoint.sh && \
    chmod +x /custom-entrypoint.sh

USER node

ENTRYPOINT ["/custom-entrypoint.sh"]
CMD ["n8n"]
