# ============================================
# Student Management System - PowerShell Run Script
# ============================================

Write-Host "`n======================================" -ForegroundColor Cyan
Write-Host "Student Management System - Running" -ForegroundColor Cyan
Write-Host "======================================`n" -ForegroundColor Cyan

# Check if Maven is installed
try {
    $mvnVersion = mvn --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Maven not found"
    }
    Write-Host "[INFO] Maven found:" -ForegroundColor Green
    Write-Host "$($mvnVersion | Select-Object -First 1)" -ForegroundColor Gray
} catch {
    Write-Host "[ERROR] Maven is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Maven: https://maven.apache.org/download.cgi" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check if Java is installed
try {
    $javaVersion = java -version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Java not found"
    }
    Write-Host "[INFO] Java found:" -ForegroundColor Green
    Write-Host "$javaVersion" -ForegroundColor Gray
} catch {
    Write-Host "[ERROR] Java is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Java 17 or higher" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "[INFO] Building project..." -ForegroundColor Cyan

# Build
$buildOutput = mvn clean install -DskipTests
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Build failed" -ForegroundColor Red
    Write-Host $buildOutput
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "[SUCCESS] Build completed!" -ForegroundColor Green
Write-Host ""
Write-Host "[INFO] Starting application..." -ForegroundColor Cyan
Write-Host "Application will run at: http://localhost:8080" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press Ctrl+C to stop the application." -ForegroundColor Yellow
Write-Host ""

# Run
mvn spring-boot:run

Read-Host "Press Enter to exit"
