@echo off
cd /d "%~dp0"
echo Starting Student Management System...
echo.
mvn clean install -DskipTests & mvn spring-boot:run
pause
