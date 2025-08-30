#!/bin/sh

# Simple permission fix script that runs on container startup
# This script will be executed automatically by the docker-entrypoint.d mechanism

# Fix permissions for uploads and images directories
chown -R node:node /app/uploads/ 2>/dev/null || true
chown -R node:node /app/client/public/images/ 2>/dev/null || true

# Set appropriate permissions
chmod -R 755 /app/uploads/ 2>/dev/null || true
chmod -R 755 /app/client/public/images/ 2>/dev/null || true

echo "Permission fix completed at container startup"