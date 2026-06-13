@echo off
REM ============================================
REM Student Management System - Run Script
REM ============================================

echo.
echo ======================================
echo Student Management System - Running
echo ======================================
echo.

REM Check if Maven is installed
mvn --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Maven is not installed or not in PATH
    echo Please install Maven: https://maven.apache.org/download.cgi
    pause
    exit /b 1
)

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java is not installed or not in PATH
    echo Please install Java 17 or higher
    pause
    exit /b 1
)

echo [INFO] Java version:
java -version
echo.

REM Clean and build
echo [INFO] Building project...
call mvn clean install -DskipTests
if errorlevel 1 (
    echo [ERROR] Build failed
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Build completed!
echo.
echo [INFO] Starting application...
echo Application will run at: http://localhost:8080
echo.
echo Press Ctrl+C to stop the application.
echo.

REM Run the application
call mvn spring-boot:run

pause
