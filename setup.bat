@echo off
REM ============================================
REM Student Management System - Simple Setup
REM ============================================

setlocal enabledelayedexpansion

echo.
echo ======================================
echo Student Management System
echo ======================================
echo.

REM Check Java version
java -version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Java is not installed!
    echo Please install Java 17 or higher
    echo.
    pause
    exit /b 1
)

echo [SUCCESS] Java is installed!
java -version
echo.

echo ============================================
echo Choose an option:
echo ============================================
echo.
echo 1 - Compile Java files only (requires Maven or Gradle)
echo 2 - Download and setup Maven (requires Internet)
echo 3 - Setup using Docker (requires Docker installed)
echo 4 - View project structure
echo 5 - Exit
echo.

set /p choice="Enter your choice (1-5): "

if "%choice%"=="1" (
    echo.
    echo To compile without Maven, please use:
    echo - Gradle: gradlew.bat (need gradle installed^)
    echo - Or install Maven first
    echo.
    pause
    goto end
)

if "%choice%"=="2" (
    echo.
    echo Starting Maven setup...
    echo Download Maven from: https://maven.apache.org/download.cgi
    echo.
    pause
    goto end
)

if "%choice%"=="3" (
    echo.
    echo Creating Docker setup...
    call :createDocker
    goto end
)

if "%choice%"=="4" (
    echo.
    echo Project Structure:
    echo.
    tree /f /a
    echo.
    pause
    goto end
)

if "%choice%"=="5" (
    exit /b 0
)

:end
pause
exit /b 0

:createDocker
echo [INFO] Creating Dockerfile...
(
    echo FROM maven:3.9-eclipse-temurin-17
    echo WORKDIR /app
    echo COPY . .
    echo RUN mvn clean install -DskipTests
    echo CMD ["mvn", "spring-boot:run"]
) > Dockerfile

echo [SUCCESS] Dockerfile created!
echo.
echo To run with Docker:
echo   docker build -t student-management .
echo   docker run -p 8080:8080 student-management
echo.
exit /b 0
