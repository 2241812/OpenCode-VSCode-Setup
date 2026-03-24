# OpenCode in VSCode Terminal - Quick Setup Guide

Get OpenCode running in your VSCode terminal with Docker and VSCode Remote Containers.

## Why Run OpenCode in Docker?

### Advantages

| Benefit | Description |
|---------|-------------|
| **Isolation** | No dependencies pollute your host machine |
| **Consistency** | Same environment across all users/contributors |
| **Security** | Sandboxed environment, easy to revoke |
| **Version Control** | Pin specific OpenCode versions |
| **Cross-Platform** | Works identically on Windows, Mac, Linux |
| **Clean State** | Start fresh every time, no accumulated junk |

### Limitations

| Limitation | Description |
|------------|-------------|
| **File Access** | Only files in mounted directories are accessible |
| **Performance** | Slight overhead compared to native execution |
| **Docker Required** | Must have Docker installed and running |
| **No GUI Apps** | Terminal-only interface |
| **Resource Usage** | Consumes memory/CPU for container runtime |

## Quick Start

### Prerequisites

- VSCode installed
- Docker installed and running
- GitHub account

### 1. Clone this repo

```bash
git clone https://github.com/YOUR_USERNAME/opencode-vscode-setup.git
cd opencode-vscode-setup
```

### 2. Open in VSCode

```bash
code opencode-vscode-setup
```

### 3. Using Remote Containers (Recommended)

1. Install **VSCode Remote Containers extension** (`ms-vscode-remote.remote-containers`)
2. Press `F1` → Select **"Remote-Containers: Reopen in Container"**
3. Wait for container to build
4. Open integrated terminal (`Ctrl+\``)
5. Run OpenCode:

```bash
opencode
```

### 4. Alternative: Run in Integrated Terminal Only

If you don't want full Remote Containers, just open a terminal:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Project Structure

```
.
├── .devcontainer/           # VSCode Remote Container config
│   └── devcontainer.json    # Container settings
├── .vscode/                 # VSCode settings
│   ├── settings.json        # Editor configuration
│   └── extensions.json      # Recommended extensions
├── docs/
│   ├── AGENTS.md            # Agent model setup guide
│   ├── DOCKER.md            # Docker setup details
│   └── QUICKSTART.md        # Detailed quick start
├── LICENSE
└── README.md
```

## VSCode Remote Containers Setup

### What is it?

Remote Containers lets you open any folder inside a Docker container as your workspace in VSCode. Your entire development environment (including OpenCode) runs inside the container.

### Benefits over basic Docker usage

- **Seamless integration** - Terminals, extensions, and file system work naturally
- **Multiple containers** - Easily switch between project environments
- **Persistent settings** - Extensions and preferences saved per container

## Configuration

### Persistent Configuration (Optional)

Mount a volume for persistent OpenCode settings:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -v ~/.opencode:/root/.opencode \
  -w /workspace \
  opencodeai/opencode
```

### Environment Variables

Create a `.env` file in your project:

```bash
# .env
OPENAI_API_KEY=sk-your-key-here
OPENAI_API_BASE=https://api.openai.com/v1
OPENCODE_MODEL=gpt-4
```

## Agent Models Guide

See [docs/AGENTS.md](./docs/AGENTS.md) for setting up different agent models.

## License

MIT
