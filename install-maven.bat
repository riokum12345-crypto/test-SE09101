@echo off
REM ============================================
REM Quick Start - Install Maven Automatically
REM ============================================

setlocal enabledelayedexpansion

echo.
echo ======================================
echo Installing Maven...
echo ======================================
echo.

REM Check if chocolatey is installed
choco --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Chocolatey is not installed!
    echo.
    echo Please install Chocolatey first:
    echo   https://chocolatey.org/install
    echo.
    echo Or download Maven manually:
    echo   https://maven.apache.org/download.cgi
    echo.
    pause
    exit /b 1
)

echo [INFO] Found Chocolatey!
echo [INFO] Installing Maven...
choco install maven -y

echo.
if errorlevel 1 (
    echo [ERROR] Maven installation failed!
) else (
    echo [SUCCESS] Maven installed!
    echo.
    echo Verifying Maven...
    mvn --version
    echo.
    echo Now you can run: run.bat
)

pause
