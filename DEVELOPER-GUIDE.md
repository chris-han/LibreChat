### Build Image
```
docker build --target node -t librechat-dev .
docker build -f Dockerfile.multi --target api-build -t librechat .
```
### Start containers
```
docker compose up -d
```

### Update .env
```
Simply restart the container with: docker compose restart app
Or stop and start the containers with: docker compose down followed by docker-compose up -d
```