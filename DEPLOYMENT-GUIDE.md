# LibreChat Deployment Guide

## Prerequisites
- Docker and Docker Compose installed
- Proper user permissions setup

## Setup Instructions

### 1. Automatic Permission Fix (Recommended)
The `docker-compose.override.yml` file includes an automatic permission fix that runs when the container starts. This ensures that the necessary directories have the correct permissions without manual intervention.

### 2. Manual Permission Setup
If you prefer to set permissions manually before deployment, run:
```bash
./setup-permissions.sh
```

This script will:
- Create necessary directories if they don't exist
- Set proper ownership of all required directories
- Ensure directories have appropriate permissions

### 3. Start the Application
After setting up permissions, start the application with:
```bash
docker compose up -d
```

## Dual-Approach for Maximum Reliability

This deployment uses two approaches for permission management:

1. **Host-level permissions** (`setup-permissions.sh`): Fixes permissions on the host system before containers start
2. **Container-level permissions** (`fix-permissions.sh`): Automatically runs within the container at startup

Using both approaches provides redundancy and ensures file uploads work correctly in all scenarios.

## Troubleshooting

### File Upload Issues
If you encounter file upload issues, check the following:

1. Ensure all directories have correct permissions:
   ```bash
   ls -la uploads/
   ls -la images/
   ls -la logs/
   ls -la data-node/
   ls -la meili_data_v1.12/
   ```

2. All directories should be owned by your user account, not root.

3. If permissions are incorrect, run the setup script:
   ```bash
   ./setup-permissions.sh
   ```

4. Restart the containers:
   ```bash
   docker compose down && docker compose up -d
   ```

### Container Startup Issues
If containers fail to start or restart continuously:

1. Check the logs for permission errors:
   ```bash
   docker compose logs api
   ```

2. Run the setup script and restart:
   ```bash
   ./setup-permissions.sh
   docker compose down && docker compose up -d
   ```

## Custom Services
This deployment includes the following custom services configured in `docker-compose.override.yml`:
- Code Interpreter service
- MCP ClickHouse service
- Custom MongoDB and Meilisearch configurations

These services will continue to work as configured while benefiting from the automatic permission fixes.