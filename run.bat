@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

docker build -t opencode-dev:latest . >nul 2>&1

set "COMMAND=%~1"
if "%COMMAND%"=="" set "COMMAND=new"

docker run -it --rm -v "%CD%:/workspace" -w /workspace opencode-dev run %COMMAND% %2 %3 %4 %5
