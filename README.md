# OpenCode in VSCode Terminal - Quick Setup Guide

Get OpenCode running in your VSCode terminal in minutes.

## Prerequisites

- VSCode installed
- Docker installed and running
- GitHub account (for agent model setup)

## Quick Start

### 1. Clone or download this repo

```bash
git clone https://github.com/YOUR_USERNAME/opencode-vscode-setup.git
cd opencode-vscode-setup
```

### 2. Open in VSCode

```bash
code opencode-vscode-setup
```

### 3. Start OpenCode in integrated terminal

In VSCode terminal (Ctrl+\`), run:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Project Structure

```
.
├── .vscode/              # VSCode settings
│   └── settings.json     # Terminal configuration
├── docs/
│   ├── AGENTS.md         # Agent model setup guide
│   └── QUICKSTART.md     # Detailed quick start
├── LICENSE
└── README.md
```

## Configuration

### Persistent Configuration (Optional)

Create a `~/.opencode/` directory on your host for persistent settings:

```bash
mkdir -p ~/.opencode
```

### Environment Variables

Set these in your shell profile for convenience:

```bash
export OPENCODE_API_KEY="your-api-key"
export OPENCODE_MODEL="opencode/big-pickle"  # or your preferred model
```

## Recommended VSCode Extensions

See [.vscode/extensions.json](./.vscode/extensions.json) for recommended extensions.

## Agent Models Guide

See [docs/AGENTS.md](./docs/AGENTS.md) for setting up different agent models.

## License

MIT
