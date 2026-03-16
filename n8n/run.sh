#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: N8N
# Runs N8N workflow automation
# ==============================================================================

bashio::log.info "Starting N8N..."

# Persistent data folder
export N8N_USER_FOLDER="/data/n8n"

# Read options from /data/options.json via bashio
TIMEZONE=$(bashio::config 'timezone')
export GENERIC_TIMEZONE="${TIMEZONE}"
export TZ="${TIMEZONE}"

# Webhook URL (optional)
if bashio::config.has_value 'webhook_url'; then
    WEBHOOK=$(bashio::config 'webhook_url')
    export WEBHOOK_URL="${WEBHOOK}"
    bashio::log.info "Webhook URL: ${WEBHOOK}"
fi

# Basic authentication
if bashio::config.has_value 'username' && bashio::config.has_value 'password'; then
    export N8N_BASIC_AUTH_ACTIVE="true"
    export N8N_BASIC_AUTH_USER=$(bashio::config 'username')
    export N8N_BASIC_AUTH_PASSWORD=$(bashio::config 'password')
    bashio::log.info "Basic authentication enabled"
else
    export N8N_BASIC_AUTH_ACTIVE="false"
    bashio::log.warning "No authentication configured — consider adding a username and password!"
fi

# SSL
SSL=$(bashio::config 'ssl')
if bashio::var.true "${SSL}"; then
    export N8N_PROTOCOL="https"
    export N8N_SSL_CERT="/ssl/$(bashio::config 'certfile')"
    export N8N_SSL_KEY="/ssl/$(bashio::config 'keyfile')"
    bashio::log.info "SSL enabled"
else
    export N8N_PROTOCOL="http"
fi

# Network settings
export N8N_HOST="0.0.0.0"
export N8N_PORT="5678"

# Disable telemetry
export N8N_DIAGNOSTICS_ENABLED="false"
export N8N_VERSION_NOTIFICATIONS_ENABLED="false"

bashio::log.info "N8N starting on port 5678..."

exec n8n start
