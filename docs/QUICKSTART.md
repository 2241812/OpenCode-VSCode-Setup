# Detailed Quick Start Guide

## Step 1: Install Prerequisites

### VSCode
Download from [code.visualstudio.com](https://code.visualstudio.com/)

### Docker
Download from [docker.com](https://www.docker.com/products/docker-desktop/)

Verify Docker is running:
```bash
docker --version
docker ps
```

## Step 2: Pull the OpenCode Image

```bash
docker pull opencodeai/opencode
```

## Step 3: Open VSCode

Open a new VSCode window and launch an integrated terminal:

- **Windows/Linux**: `Ctrl+\``
- **Mac**: `Cmd+\``

## Step 4: Navigate to Your Project

```bash
cd /path/to/your/project
```

## Step 5: Start OpenCode

Run this command in the terminal:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Step 6: You're Ready!

Start asking questions or giving tasks to OpenCode. Example:

```
Help me create a new React component called Button
```

## Working with GitHub Repos

### Clone a repo first:

```bash
git clone https://github.com/username/repo-name.git
cd repo-name
code .
```

### Then start OpenCode:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Using with GitHub CLI

If you have GitHub CLI installed:

```bash
# Clone using gh
gh repo clone username/repo-name
cd repo-name

# Open in VSCode
code .

# Start OpenCode in terminal
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Tips

1. **Persistent History**: Mount a volume for command history
2. **Multiple Projects**: Each project directory should be a separate clone
3. **Resource Usage**: Close Docker desktop when not in use to save resources
