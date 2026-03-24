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
* Visual Studio Code
* Docker Desktop / Engine
* GitHub Account

### 1. Clone and Open

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
code .
```

### 2. Open in Container

Install the **Dev Containers** extension (published by Microsoft):

1. Open VSCode Extensions (`Ctrl+Shift+X`)
2. Search for "Dev Containers"
3. Click **Install**

After installing:

1. VSCode will prompt **"Reopen in Container"** - click it
2. Wait for the container to build (~2-3 min first time)

### 3. Run OpenCode

Open the integrated terminal (`` Ctrl+` ``) and run:

```bash
opencode
```

That's it! Use OpenCode however you want - ask questions, write code, debug, etc.

---

## 🏗️ How It Works

The Dockerfile sets up a complete OpenCode environment:

| Step | What It Does |
|------|--------------|
| 1 | Creates `devuser` - a non-root user for security |
| 2 | Pre-creates config directories (`~/.config/opencode`, `~/.local/share/opencode`, `~/.ssh`) |
| 3 | Installs OpenCode via the official install script |
| 4 | Sets up PATH to include OpenCode binaries |

---

## 🏗️ Project Structure

```
.
├── .devcontainer/
│   └── devcontainer.json  # Dev Container configuration
├── .vscode/
│   ├── settings.json
│   └── extensions.json
├── docs/
│   ├── AGENTS.md
│   ├── DOCKER.md
│   └── QUICKSTART.md
├── Dockerfile           # Build your own OpenCode image
├── docker-compose.yml   # Easy container management
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

Then run `opencode` in the terminal.

---

## 🤖 Agent Models Guide

Looking to swap out or configure different models? Check out the detailed [Agents Setup Guide](./docs/AGENTS.md).

---

## 📄 License

This project is licensed under the **MIT License**. This means you are free to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, provided you include the original copyright notice and permission notice. See the `LICENSE` file for more details.
