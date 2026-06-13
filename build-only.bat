@echo off
REM ============================================
REM Build Only - No Run
REM ============================================

echo.
echo ======================================
echo Building Student Management System
echo ======================================
echo.

mvn clean install

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    pause
    exit /b 1
) else (
    echo.
    echo [SUCCESS] Build completed!
    echo JAR file location: target\student-management-1.0.0.jar
    echo.
    pause
)
