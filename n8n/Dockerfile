ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for app
RUN \
  apk add --no-cache \
    nodejs \
    npm \
    python3 \
    make \
    g++

# Install N8N
ARG N8N_VERSION=2.12.0
RUN npm install -g n8n@${N8N_VERSION} --unsafe-perm

# Create persistent data directory
RUN mkdir -p /data/n8n

# Copy run script
COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /data

CMD [ "/run.sh" ]
