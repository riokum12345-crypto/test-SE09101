@echo off
REM ============================================
REM Run Unit Tests
REM ============================================

echo.
echo ======================================
echo Running Unit Tests
echo ======================================
echo.

mvn clean test

if errorlevel 1 (
    echo.
    echo [ERROR] Tests failed!
) else (
    echo.
    echo [SUCCESS] All tests passed!
)

pause
