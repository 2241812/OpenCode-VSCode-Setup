# 🚀 OpenCode in VSCode Terminal

> **Supercharge your workflow:** Run OpenCode directly inside your VSCode terminal using Docker and Remote Containers for a clean, isolated, and highly reproducible AI development environment.

![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![VSCode](https://img.shields.io/badge/VSCode-Remote_Containers-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

## ⚖️ Why Run OpenCode in Docker?

### ✨ The Advantages

| Benefit | Description |
|---------|-------------|
| 🛡️ **Isolation** | No dependencies pollute your host machine |
| 🔄 **Consistency** | Same environment across all users and contributors |
| 🔒 **Security** | Sandboxed environment that is easy to revoke |
| 📌 **Version Control** | Pin specific OpenCode versions with ease |
| 💻 **Cross-Platform** | Works identically on Windows, Mac, and Linux |
| 🧹 **Clean State** | Start fresh every time, no accumulated junk |

### ⚠️ The Trade-offs

| Limitation | Description |
|------------|-------------|
| 📁 **File Access** | Only files in mounted directories are accessible |
| ⚡ **Performance** | Slight overhead compared to native execution |
| 🐳 **Docker Required** | Must have Docker installed and running |
| 🖥️ **No GUI Apps** | Strictly a terminal-only interface |
| 📈 **Resource Usage** | Consumes memory/CPU for container runtime |

---

## ⚡ Quick Start

### Prerequisites
* Docker Desktop / Engine (required)
* GitHub Account

### Option A: Quick Start (No VSCode Required)

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
./run new
```

That's it! The script automatically:
1. Builds the Docker image (first time only)
2. Starts the container
3. Launches OpenCode

**Session commands:**
```bash
./run new my-feature    # Start named session
./run list              # See saved sessions
./run resume <name>     # Resume a session
./run delete <name>     # Delete a session
```

---

### Option B: VSCode Dev Containers

If you prefer using VSCode Dev Containers extension:

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
code .
```

1. Press `F1` and select **"Dev Containers: Reopen in Container"**
2. Wait for the container to build

Then in the VSCode terminal:
```bash
run new           # Start new session
run list          # List sessions
run resume <name> # Resume session
```

---

## 🏗️ How It Works

The Dockerfile sets up a complete OpenCode environment:

| Step | What It Does |
|------|--------------|
| 1 | Creates `devuser` - a non-root user for security |
| 2 | Pre-creates config directories (`~/.config/opencode`, `~/.local/share/opencode`, `~/.ssh`) |
| 3 | Installs OpenCode via the official install script |
| 4 | Sets up PATH to include OpenCode binaries |

When you use VS Code Remote Containers, everything is pre-configured - just clone and run `opencode`.

---

## 🏗️ Project Structure

```
.
├── .devcontainer/
│   └── devcontainer.json  # Dev Container configuration (auto-detected by VSCode)
├── .vscode/
│   ├── settings.json
│   └── extensions.json
├── docs/
│   ├── AGENTS.md
│   ├── DOCKER.md
│   ├── QUICKSTART.md
│   └── SESSIONS.md      # Session management guide
├── Dockerfile           # Build your own OpenCode image
├── docker-compose.yml   # Easy container management
├── run                  # Session management script
├── LICENSE
└── README.md
```

---

## 🛠️ Configuration & Setup

### Connect an AI Provider

Before using OpenCode, you need to connect an AI provider:

```bash
opencode
/init
```

Then run `/connect` to add your API key. Or set environment variables:

Create a `.env` file in the project root:

```bash
OPENAI_API_KEY=sk-your-key-here
```

### VSCode Remote Containers

**What is it?**

Remote Containers lets you open any folder inside a Docker container as your workspace in VSCode. Your entire development environment—including OpenCode—runs securely inside the container.

**Benefits:**
- **Seamless integration:** Terminals, extensions, and the file system work naturally
- **Multiple containers:** Easily switch between isolated project environments
- **Persistent settings:** Extensions and preferences are saved per container

### Docker Only (No VS Code)

If you prefer to run without VS Code Remote Containers:

**Using docker-compose:**
```bash
cp .env.example .env
# Add your API key to .env
docker-compose up
```

**Or build and run manually:**
```bash
docker build -t opencode-dev .
docker run -it --rm -v $(pwd):/workspace -w /workspace opencode-dev
```

---

## 💾 Session Management

OpenCode sessions allow you to save and resume conversations. Use the `run` script to manage sessions:

> **Important:** Make sure you're running these commands in the **VSCode integrated terminal** (`` Ctrl+` ``) inside the container. The `run` command won't exist on your host machine.
>
> **Note:** Inside the container, `run` is installed to `/usr/local/bin/` and available in your PATH. Use `run` (without `./`) from any directory.

### Commands

| Command | Description |
|---------|-------------|
| `run new [name]` | Start a new session (optionally named) |
| `run resume <name>` | Resume a saved session |
| `run list` | List all saved sessions |
| `run delete <name>` | Delete a session |

### Examples

```bash
# Start a new session with auto-generated name
run new

# Start a named session for a specific feature
run new user-authentication

# Resume working on a previous session
run resume user-authentication

# View all your saved sessions
run list

# Delete an old session
run delete old-feature
```

Sessions are stored in `.opencode-sessions/` directory and persist across container restarts.

For detailed session management, see the [Session Management Guide](./docs/SESSIONS.md).

---

## 🤖 Agent Models Guide

Looking to swap out or configure different models? Check out the detailed [Agents Setup Guide](./docs/AGENTS.md).

---

## 📄 License

This project is licensed under the **MIT License**. This means you are free to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, provided you include the original copyright notice and permission notice. See the `LICENSE` file for more details.
