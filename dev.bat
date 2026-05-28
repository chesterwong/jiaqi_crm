@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ============================================================
:: FastApiAdmin 一键启动 — 自动托管到 Git Bash
:: 双击即可启动本地开发环境
:: ============================================================

:: 自动检测 Git Bash 路径
set "GIT_BASH="
if exist "C:\Program Files\Git\bin\bash.exe" set "GIT_BASH=C:\Program Files\Git\bin\bash.exe"
if exist "D:\Program Files\Git\bin\bash.exe" set "GIT_BASH=D:\Program Files\Git\bin\bash.exe"

if "%GIT_BASH%"=="" (
    echo [ERROR] 找不到 Git Bash
    echo 请安装 Git for Windows: https://git-scm.com/download/win
    pause
    exit /b 1
)

:: 自动检测项目根目录 (bat 文件所在目录)
set "PROJECT_DIR=%~dp0"
:: 去掉末尾反斜杠
if "%PROJECT_DIR:~-1%"=="\" set "PROJECT_DIR=%PROJECT_DIR:~0,-1%"

:: 转换为 Git Bash 路径格式 (D:\path → /d/path)
set "BASH_DIR=%PROJECT_DIR%"
set "BASH_DIR=%BASH_DIR:\=/%"
set "BASH_DIR=%BASH_DIR::=%"
:: 盘符转小写
set "BASH_DIR=/%BASH_DIR%"

echo.
echo ==========================================
echo   FastApiAdmin 本地开发环境 一键启动
echo ==========================================
echo.
echo   项目目录: %PROJECT_DIR%
echo   Git Bash:  %GIT_BASH%
echo.

:: 启动 Git Bash 并执行 dev.sh
start "FastApiAdmin-Dev" "%GIT_BASH%" --login -i -c "cd '%BASH_DIR%' && bash dev.sh start; echo; echo 按 Ctrl+C 停止所有服务; echo; exec bash"
