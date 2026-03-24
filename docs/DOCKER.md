# Docker Setup Details

## Understanding the Docker Environment

### Why Docker for OpenCode?

1. **Dependency Isolation**
   - OpenCode may require specific Python versions, Node.js, or system packages
   - Docker ensures these don't conflict with your host system
   - No more "it works on my machine" problems

2. **Consistent Experience**
   - Every user/agent gets the same environment
   - Reproducible builds and deployments
   - Version pinning made easy

3. **Security**
   - Running code in sandboxed containers
   - Easy to revoke access (stop container)
   - No permanent changes to host system

4. **Multi-Project Management**
   - Each project can have its own OpenCode version
   - No cross-contamination between projects
   - Easy cleanup (just remove the container)

## Current Limitations

### File System Access

```
Container filesystem
├── /workspace        ← Only this is accessible!
│   └── (your mounted project files)
└── /root/.opencode   ← Config (if mounted)
```

**What this means:**
- Cannot read files outside `/workspace`
- Cannot access host's home directory
- Must mount volumes explicitly

### Docker Requirements

- Docker daemon must be running
- Minimum 2GB RAM recommended
- Linux containers (on Windows/Mac, uses WSL2 or Hyper-V)

## Advantages Summary

| Aspect | Without Docker | With Docker |
|--------|---------------|-------------|
| Setup time | Variable | Instant with image |
| Conflicts | Common | None |
| Cleanup | Manual | Automatic |
| Sharing | "Works on my machine" | Exact replica |
| Permissions | Host-based | Container-based |
| Isolation | Poor | Strong |

## Docker Commands Reference

### Run OpenCode manually

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### Run with persistent config

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -v ~/.opencode:/root/.opencode \
  -w /workspace \
  opencodeai/opencode
```

### Run with environment file

```bash
docker run -it --rm \
  --env-file .env \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### Check if Docker is running

```bash
docker ps
```

### Remove all stopped containers

```bash
docker container prune
```

## Troubleshooting

### Permission Denied

```bash
docker run -it --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### Docker not running

```bash
# Linux
sudo systemctl start docker

# macOS/Windows
# Start Docker Desktop application
```

### Volume mount issues

```bash
# Check volume exists
docker volume ls

# Inspect volume
docker volume inspect volume_name
```
