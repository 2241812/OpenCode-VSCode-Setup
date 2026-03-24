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

### 1. Clone the Repository

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
```

### 2. Open in VSCode

```bash
code opencode-vscode-setup
```

### 3. Launch with Remote Containers (⭐️ Recommended)

Install the VSCode Remote Containers extension (`ms-vscode-remote.remote-containers`).

1. Press `F1` and select **"Remote-Containers: Reopen in Container"**
2. Wait for the container to build
3. Open the integrated terminal (`` Ctrl+` ``)
4. Run OpenCode:

```bash
opencode
```

### 4. Alternative: Integrated Terminal Only

If you prefer to skip the full Remote Containers setup, just open your standard terminal and run:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

---

## 🏗️ Project Structure

```
.
├── .devcontainer/
│   └── devcontainer.json
├── .vscode/
│   ├── settings.json
│   └── extensions.json
├── docs/
│   ├── AGENTS.md
│   ├── DOCKER.md
│   └── QUICKSTART.md
├── LICENSE
└── README.md
```

---

## 🛠️ Configuration & Setup

### VSCode Remote Containers

**What is it?**

Remote Containers lets you open any folder inside a Docker container as your workspace in VSCode. Your entire development environment—including OpenCode—runs securely inside the container.

**Benefits over basic Docker usage:**
- **Seamless integration:** Terminals, extensions, and the file system work naturally
- **Multiple containers:** Easily switch between isolated project environments
- **Persistent settings:** Extensions and preferences are saved per container

### Persistent Configuration (Optional)

To keep your OpenCode settings between sessions, mount a volume:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -v ~/.opencode:/root/.opencode \
  -w /workspace \
  opencodeai/opencode
```

### Environment Variables

Create a `.env` file in the root of your project:

```bash
OPENAI_API_KEY=sk-your-key-here
OPENAI_API_BASE=https://api.openai.com/v1
OPENCODE_MODEL=gpt-4
```

---

## 🤖 Agent Models Guide

Looking to swap out or configure different models? Check out the detailed [Agents Setup Guide](./docs/AGENTS.md).

---

## 📄 License

This project is licensed under the **MIT License**. This means you are free to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, provided you include the original copyright notice and permission notice. See the `LICENSE` file for more details.
