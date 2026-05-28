@echo off
chcp 65001 >nul
echo ========================================
echo    FastApiAdmin 一键启动脚本
echo ========================================
echo.

:: 设置 uv 路径（如果未添加到系统 PATH）
set "UV_PATH=%APPDATA%\Python\Python312\Scripts"
if exist "%UV_PATH%\uv.exe" (
    set "PATH=%PATH%;%UV_PATH%"
)

echo [1/3] 检查 uv 是否已安装...
where uv >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ uv 未找到，正在安装...
    python -m pip install uv --user
    if %errorlevel% neq 0 (
        echo ❌ uv 安装失败
        pause
        exit /b 1
    )
    echo ✅ uv 安装成功
) else (
    echo ✅ uv 已安装
    uv --version
)

echo.
echo [2/3] 启动后端服务 (端口: 8001)...
cd /d "%~dp0backend"
start "FastApiAdmin Backend" cmd /k "export PATH=%%PATH%%;C:\Users\boston\AppData\Roaming\Python\Python312\Scripts && uv run main.py run --env=dev"

echo.
echo [3/3] 启动前端服务 (端口: 5180)...
cd /d "%~dp0frontend"

:: 检查 node_modules 是否存在
if not exist "node_modules\.pnpm" (
    echo ️  前端依赖未安装，正在安装...
    call pnpm install
    if %errorlevel% neq 0 (
        echo ❌ 前端依赖安装失败
        pause
        exit /b 1
    )
    echo ✅ 前端依赖安装完成
) else (
    echo ✅ 前端依赖已安装
)

echo.
start "FastApiAdmin Frontend" cmd /k "pnpm dev"

:: 等待服务启动
echo.
echo 等待服务启动...
timeout /t 10 /nobreak >nul

echo.
echo ========================================
echo    服务启动完成！
echo ========================================
echo.
echo 🌐 后端地址: http://localhost:8001
echo 🌐 前端地址: http://localhost:5180
echo  API文档: http://localhost:8001/api/v1/docs
echo.
echo  提示:
echo - 两个新窗口已打开，请勿关闭
echo - 按任意键退出此窗口...
pause >nul
