#!/bin/sh
set -e

CONFIG_PATH="${CLI_PROXY_CONFIG_PATH:-/CLIProxyAPI/config.yaml}"
AUTH_PATH="${CLI_PROXY_AUTH_PATH:-/root/.cli-proxy-api}"

# Create parent directory for config if needed
mkdir -p "$(dirname "$CONFIG_PATH")"

# Copy default config if not exists
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Config not found at $CONFIG_PATH, copying default..."
    cp /CLIProxyAPI/config.default.yaml "$CONFIG_PATH"
fi

# Create auth directory if not exists
mkdir -p "$AUTH_PATH"

# Start app with config path
exec ./CLIProxyAPIPlus -config "$CONFIG_PATH"
