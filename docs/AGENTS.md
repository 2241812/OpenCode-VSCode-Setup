# Agent Models Setup Guide

This guide explains how to configure different agent models with OpenCode.

## Available Models

### 1. Default Model (Big Pickle)

The default model that comes pre-configured with OpenCode.

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### 2. Custom OpenAI Compatible Models

To use other OpenAI-compatible models, set the API endpoint and key:

```bash
docker run -it --rm \
  -e OPENAI_API_KEY="your-api-key" \
  -e OPENAI_API_BASE="https://api.openai.com/v1" \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

### 3. Anthropic Claude Models

```bash
docker run -it --rm \
  -e ANTHROPIC_API_KEY="your-anthropic-key" \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode --model claude-3-sonnet
```

### 4. Using a .env File

Create a `.env` file in your project:

```bash
# .env
OPENAI_API_KEY=sk-your-key-here
OPENAI_API_BASE=https://api.openai.com/v1
OPENCODE_MODEL=gpt-4
```

Then run:

```bash
docker run -it --rm \
  --env-file .env \
  -v $(pwd):/workspace \
  -w /workspace \
  opencodeai/opencode
```

## Shell Alias

Add this to your `~/.bashrc` or `~/.zshrc` for quick access:

```bash
alias opencode='docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  -e OPENAI_API_KEY \
  opencodeai/opencode'
```

Then reload your shell:

```bash
source ~/.bashrc  # or source ~/.zshrc
```

Now just type `opencode` from any directory!

## Environment Variables Reference

| Variable | Description | Required |
|----------|-------------|----------|
| `OPENAI_API_KEY` | Your API key | Yes (for OpenAI) |
| `OPENAI_API_BASE` | API base URL | No |
| `OPENCODE_MODEL` | Model to use | No |
| `ANTHROPIC_API_KEY` | Anthropic API key | Yes (for Claude) |

## Troubleshooting

### Permission Issues

If you get permission errors with mounted volumes:

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  --user $(id -u):$(id -g) \
  opencodeai/opencode
```

### API Key Not Found

Make sure environment variables are properly set. Check with:

```bash
echo $OPENAI_API_KEY
```
