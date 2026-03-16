ARG BUILD_FROM
FROM $BUILD_FROM

# Install Node.js and N8N
RUN apk add --no-cache \
    nodejs \
    npm \
    python3 \
    make \
    g++

# Set N8N version
ARG N8N_VERSION=2.12.0

# Install N8N globally
RUN npm install -g n8n@${N8N_VERSION} --unsafe-perm

# Create data directory
RUN mkdir -p /data/n8n

# Copy root filesystem
COPY rootfs /

# Set correct permissions for run script
RUN chmod a+x /etc/services.d/n8n/run

# Set working directory
WORKDIR /data

# Expose N8N port
EXPOSE 5678
