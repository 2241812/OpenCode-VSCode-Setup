# Docker Setup Guide

This guide covers everything you need to run OpenCode in Docker, including building your own image and using it with VS Code Remote Containers.

## Quick Reference

### Option 1: Use Pre-built Image (Simplest)

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### Option 2: Build Your Own Image

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
docker build -t opencode-dev .
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencode-dev
```

---

## The Dockerfile Explained

The included `Dockerfile` creates a proper development environment:

```dockerfile
FROM ubuntu:24.04

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates git openssh-client sudo vim

# Create a non-root user (devuser)
RUN useradd -m -s /bin/bash devuser && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/devuser

USER devuser
WORKDIR /home/devuser

# Create required directories for OpenCode
RUN mkdir -p /home/devuser/.config/opencode \
    && mkdir -p /home/devuser/.local/share/opencode \
    && mkdir -p /home/devuser/.ssh

# Install OpenCode
RUN curl -fsSL https://opencode.ai/install | bash

ENV PATH="/home/devuser/.opencode/bin:${PATH}"

WORKDIR /workspace

ENTRYPOINT ["opencode"]
```

### Key Components:

| Component | Purpose |
|-----------|---------|
| `ubuntu:24.04` | Base image - modern and stable |
| `devuser` | Non-root user for security |
| `~/.config/opencode` | OpenCode config directory |
| `~/.local/share/opencode` | OpenCode data directory |
| `~/.ssh` | SSH keys for Git access |
| `PATH` | Includes OpenCode binary location |

---

## Using Docker Compose (Recommended)

### 1. Create a `.env` file:

```bash
# .env
OPENAI_API_KEY=sk-your-key-here
GITHUB_TOKEN=ghp_your_github_token
```

### 2. Run with docker-compose:

```bash
docker-compose up
```

### 3. Run in background:

```bash
docker-compose up -d
docker-compose exec opencode bash
```

---

## VS Code Remote Containers

### Option A: Use the Dockerfile Directly

1. Open the project in VS Code
2. Press `F1` → "Remote-Containers: Open Folder in Container..."
3. VS Code will build the image from the included `Dockerfile`
4. Open integrated terminal and run `opencode`

### Option B: Update devcontainer.json

Edit `.devcontainer/devcontainer.json` to use your custom Dockerfile:

```json
{
  "name": "opencode-dev",
  "dockerfile": "../Dockerfile",
  "forwardPorts": [],
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode-remote.remote-containers"
      ],
      "settings": {
        "terminal.integrated.defaultProfile.linux": "bash"
      }
    }
  },
  "mounts": [
    "source=${localWorkspaceFolder},target=/workspace,type=bind"
  ],
  "postCreateCommand": "opencode --version"
}
```

---

## GitHub Authentication in Docker

### Option 1: Environment Variable

```bash
docker run -it --rm \
  -e GITHUB_TOKEN=ghp_your_token_here \
  -v $(pwd):/workspace \
  -w /workspace \
  opencode-dev
```

### Option 2: Mount SSH Keys

```bash
docker run -it --rm \
  -v ~/.ssh:/home/devuser/.ssh:ro \
  -v $(pwd):/workspace \
  -w /workspace \
  opencode-dev
```

### Option 3: Git Credential Store

Add to your Dockerfile before the `USER devuser` line:

```dockerfile
RUN git config --global credential.helper store && \
    echo "https://ghp_YOURTOKEN:@github.com" > /home/devuser/.git-credentials
```

---

## Persistent Configuration

### Mount OpenCode Config

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -v ~/.opencode:/home/devuser/.opencode \
  -w /workspace \
  opencode-dev
```

### Create a Shell Alias

Add to `~/.bashrc` or `~/.zshrc`:

```bash
alias opencode='docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  -v ~/.opencode:/home/devuser/.opencode \
  opencode-dev'
```

Then reload: `source ~/.bashrc`

---

## Troubleshooting

### Permission Denied on Mounted Files

```bash
docker run -it --rm \
  --user $(id -u):$(id -g) \
  -v $(pwd):/workspace \
  -w /workspace \
  opencode-dev
```

### Docker not running

```bash
# Linux
sudo systemctl start docker

# macOS/Windows
# Start Docker Desktop
```

### Build fails with "Permission denied"

Make sure you have write permissions to the directory:

```bash
chmod 755 .
docker build -t opencode-dev .
```

### Container exits immediately

The `ENTRYPOINT ["opencode"]` requires an interactive terminal:

```bash
docker run -it --rm opencode-dev
# NOT: docker run --rm opencode-dev
```

---

## Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `OPENAI_API_KEY` | OpenAI API key | `sk-...` |
| `OPENAI_API_BASE` | Custom API endpoint | `https://api.openai.com/v1` |
| `ANTHROPIC_API_KEY` | Anthropic API key | `sk-ant-...` |
| `GITHUB_TOKEN` | GitHub PAT | `ghp_...` |
