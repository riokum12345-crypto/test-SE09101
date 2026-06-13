@echo off
REM ============================================
REM Run JAR File Directly
REM ============================================

echo.
echo ======================================
echo Running JAR File
echo ======================================
echo.

if not exist "target\student-management-1.0.0.jar" (
    echo [ERROR] JAR file not found!
    echo Please run 'build-only.bat' first to build the project.
    echo.
    pause
    exit /b 1
)

echo [INFO] Starting application from JAR...
echo Application will run at: http://localhost:8080
echo.
echo Press Ctrl+C to stop the application.
echo.

java -jar target\student-management-1.0.0.jar

pause
