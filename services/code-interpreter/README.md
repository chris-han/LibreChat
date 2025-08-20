# LibreChat Code Interpreter Service

This service provides a secure sandbox environment for executing code in multiple programming languages.

## Features

- Execute code in various programming languages (Python, JavaScript, TypeScript, C, C++, Java, PHP, Go, Rust, R, D, Fortran90)
- File upload and management
- Secure execution environment with timeouts
- RESTful API compliant with the OpenAPI specification

## Supported Languages

- Python (`.py`)
- JavaScript (`.js`)
- TypeScript (`.ts`)
- C (`.c`)
- C++ (`.cpp`)
- Java (`.java`)
- PHP (`.php`)
- Go (`.go`)
- Rust (`.rs`)
- R (`.R`)
- D (`.d`)
- Fortran90 (`.f90`)

## API Endpoints

### Execute Code
```
POST /v1/exec
```

Execute code in a specified language with optional arguments and file references.

### Upload Files
```
POST /v1/upload
```

Upload files to be used during code execution.

### Get Files Information
```
GET /v1/files/{session_id}
```

Retrieve information about files associated with a session.

### Delete a File
```
DELETE /v1/files/{session_id}/{file_id}
```

Delete a specific file from a session.

### Download a File
```
GET /v1/download/{session_id}/{file_id}
```

Download a generated file from a session.

### Health Check
```
GET /v1/health
```

Check the health status of the service.

## Environment Variables

- `CODE_API_KEY`: API key for authenticating requests (default: "default-api-key")
- `PORT`: Port to run the service on (default: 8700)

## Deployment

The service can be deployed using Docker Compose:

```bash
docker-compose up --build
```

Make sure to set a secure `CODE_API_KEY` in your environment or docker-compose configuration.