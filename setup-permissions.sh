#!/bin/bash

# Setup script to ensure proper permissions for LibreChat deployment

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to the project directory
cd "$SCRIPT_DIR"

echo "Setting proper permissions for LibreChat directories..."

# Create directories if they don't exist
mkdir -p uploads
mkdir -p images
mkdir -p logs
mkdir -p data-node
mkdir -p meili_data_v1.12
mkdir -p services/code-interpreter/data

# Set ownership of all directories
echo "Setting permissions for all directories..."
sudo chown -R $(id -u):$(id -g) uploads/ images/ logs/ data-node/ meili_data_v1.12/ services/

# Set appropriate permissions
echo "Setting appropriate permissions..."
sudo chmod -R 755 uploads/ images/ logs/ data-node/ meili_data_v1.12/ services/

# Special case for logs directory - needs to be writable by the app
chmod -R 777 logs/ 2>/dev/null || echo "Warning: Could not set 777 permissions on logs directory"

# Special case for code interpreter data directory
chmod -R 777 services/code-interpreter/data/ 2>/dev/null || echo "Warning: Could not set 777 permissions on code interpreter data directory"

echo "Permissions setup complete!"
echo "You can now start LibreChat with: docker compose up -d"