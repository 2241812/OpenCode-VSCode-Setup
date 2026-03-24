# Session Management Guide

This guide explains how to save, resume, and manage OpenCode sessions.

> **Note:** Inside the container, the `run` script is installed to `/usr/local/bin/` and available in your PATH. Use `run` (without `./`) from any directory. If running outside the container, use `./run` from the project directory.

## What Are Sessions?

Sessions in OpenCode allow you to:
- **Pause and resume** conversations without losing context
- **Save multiple projects** separately
- **Share session IDs** with collaborators
- **Maintain context** across multiple work sessions

## Quick Reference

```bash
run new [name]          # Start new session
run resume <name>       # Resume saved session
run list                # List all sessions
run delete <name>       # Delete a session
run help                # Show all commands
```

> **Tip:** If running outside the container, use `./run` instead of `run`.

## Starting a New Session

### Anonymous Session (Auto-generated name)

```bash
./run new
```

This creates a session with an auto-generated name like `session-20260324-143052`.

### Named Session

```bash
./run new my-feature
```

Named sessions make it easier to find and resume specific work.

## Resuming a Session

### List Available Sessions

```bash
./run list
```

Output:
```
📁 Saved Sessions:
──────────────────
  [1] user-authentication
      ID: ses_abc123 | Last modified: 2026-03-24
  [2] session-20260324-143052
      ID: ses_xyz789 | Last modified: 2026-03-23
```

### Resume by Name

```bash
./run resume user-authentication
```

## Session Storage

Sessions are stored in `.opencode-sessions/` directory:

```
.opencode-sessions/
├── my-feature/
│   ├── .session_id        # The OpenCode session ID
│   ├── .last_session_id   # Most recent session ID
│   ├── .opencode_data/    # Conversation history
│   └── .output            # Last session output
└── another-session/
    └── ...
```

## Sharing Sessions

### Get Session ID

```bash
cat .opencode-sessions/<session-name>/.session_id
```

### Resume with Session ID

If someone shares a session ID with you:

```bash
opencode -s ses_abc123xyz
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `SESSIONS_DIR` | `./.opencode-sessions` | Where sessions are stored |

### Example: Custom Sessions Directory

```bash
SESSIONS_DIR=~/my-opencode-sessions ./run new myproject
```

## Best Practices

### 1. Use Descriptive Names

```bash
./run new user-dashboard-redesign
./run new api-refactor
./run new bugfix-login-timeout
```

### 2. Regular Cleanup

```bash
# List sessions
./run list

# Delete old/unused sessions
./run delete old-feature
```

### 3. Commit Sessions (Optional)

If you want to track session history in git:

```bash
# Add to .gitignore
echo ".opencode-sessions/" >> .gitignore
echo ".opencode_data/" >> .gitignore
```

Or track them if useful for your workflow:

```bash
git add .opencode-sessions/
git commit -m "Add session backup"
```

## Troubleshooting

### Session Not Found

```
❌ Session not found: my-feature
```

**Solution:** Run `./run list` to see available sessions.

### Lost Session Context

If you can't find a session:

1. Check `.opencode-sessions/` directory
2. Look in `~/.local/share/opencode/` for orphaned sessions
3. Use `opencode -s <session_id>` with any saved session ID

### Permission Issues

If you can't access sessions:

```bash
chmod -R 755 .opencode-sessions/
```

## Docker-Only Usage

Without the container, you can still use sessions directly with the `opencode` command:

```bash
# Run with session persistence
docker run -it --rm \
  -v $(pwd):/workspace \
  -v opencode-sessions:/home/devuser/.local/share/opencode \
  -w /workspace \
  opencode-dev

# Or use a specific session ID
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  opencode-dev -s ses_abc123xyz
```

## Summary

| Task | Command |
|------|---------|
| Start new session | `run new [name]` |
| Resume session | `run resume <name>` |
| List sessions | `run list` |
| Delete session | `run delete <name>` |
| Get session ID | `cat .opencode-sessions/<name>/.session_id` |
