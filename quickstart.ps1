# ============================================
# Student Management System - Quick Setup
# ============================================

Write-Host "`n=====================================" -ForegroundColor Cyan
Write-Host "Student Management System - Setup" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Check Java
Write-Host "[1/3] Checking Java..." -ForegroundColor Yellow
$javaCheck = java -version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Java not found!" -ForegroundColor Red
    Write-Host "Install from: https://www.oracle.com/java/technologies/downloads/" -ForegroundColor Yellow
    exit 1
}
Write-Host "[OK] Java installed" -ForegroundColor Green
Write-Host ""

# Check/Install Maven
Write-Host "[2/3] Checking Maven..." -ForegroundColor Yellow
$mavenCheck = mvn --version 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "[MISSING] Maven not found" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Choose installation method:" -ForegroundColor Cyan
    Write-Host "1 - Install via Chocolatey (requires admin)" -ForegroundColor Gray
    Write-Host "2 - Download manually" -ForegroundColor Gray
    Write-Host ""
    
    $choice = Read-Host "Enter choice (1-2)"
    
    if ($choice -eq "1") {
        Write-Host "[INFO] Installing Maven via Chocolatey..." -ForegroundColor Yellow
        choco install maven -y
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Maven installed" -ForegroundColor Green
        }
    } else {
        Write-Host "Download Maven from: https://maven.apache.org/download.cgi" -ForegroundColor Yellow
        exit 1
    }
} else {
    Write-Host "[OK] Maven installed" -ForegroundColor Green
}
Write-Host ""

# Build
Write-Host "[3/3] Building project..." -ForegroundColor Yellow
Write-Host ""
mvn clean install -DskipTests

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "[SUCCESS] Build completed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Start application with:" -ForegroundColor Cyan
    Write-Host "  mvn spring-boot:run" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Or run: .\run.bat" -ForegroundColor Gray
} else {
    Write-Host ""
    Write-Host "[ERROR] Build failed!" -ForegroundColor Red
}

Read-Host "Press Enter to exit"
