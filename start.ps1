#!/usr/bin/env pwsh
Push-Location $PSScriptRoot
Write-Host "Starting Student Management System..." -ForegroundColor Cyan
mvn clean install -DskipTests; mvn spring-boot:run
Read-Host "Press Enter to exit"
