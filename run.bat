@echo off
echo Building OpenCode container...
docker build -t opencode-dev:latest .

echo.
echo Starting OpenCode...
docker run -it --rm -v "%CD%:/workspace" -w /workspace opencode-dev
