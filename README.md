# OpenCode in VSCode

Run OpenCode inside a Docker container via VSCode Dev Containers - clean, isolated, and reproducible.

---

## Why Docker?

| Benefit | Description |
|---------|-------------|
| Isolation | No dependencies pollute your machine |
| Consistency | Same environment for everyone |
| Security | Sandboxed environment |
| Clean State | Start fresh every time |

---

## Quick Start

### Prerequisites
* Docker Desktop
* VSCode with Dev Containers extension

### Steps

```bash
git clone https://github.com/2241812/OpenCode-VSCode-Setup.git
cd OpenCode-VSCode-Setup
code .
```

1. VSCode prompts **"Reopen in Container"** - click it
2. Wait for build (~2-3 min first time)
3. In terminal, run:
```bash
opencode
```

That's it! Use OpenCode however you want - ask questions, write code, debug, etc.

---

## Connect an AI Provider

```bash
opencode
/init
```

Then run `/connect` to add your API key, or create a `.env` file:

```bash
OPENAI_API_KEY=your-key-here
```

---

## Without VSCode

```bash
docker build -t opencode-dev .
docker run -it --rm -v $(pwd):/workspace -w /workspace opencode-dev
```

Or with docker-compose:
```bash
cp .env.example .env
# Add your API key
docker-compose up
```

---

## How It Works

The Dockerfile sets up Ubuntu with OpenCode pre-installed. When you open in VSCode:
1. Dev Containers builds the image
2. Opens terminal inside the container
3. Run `opencode` to start

---

## License

MIT
