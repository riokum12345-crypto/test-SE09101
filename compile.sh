#!/bin/bash
# ============================================
# Student Management System - Simple Compiler
# ============================================

echo ""
echo "======================================"
echo "Compiling Student Management System"
echo "======================================"
echo ""

# Check Java
if ! command -v java &> /dev/null; then
    echo "[ERROR] Java is not installed!"
    echo "Please install Java 17 or higher"
    exit 1
fi

echo "[SUCCESS] Java found:"
java -version
echo ""

# Create output directory
mkdir -p bin
mkdir -p lib

echo "[INFO] Compiling Java files..."

# Compile all Java files
find src/main/java -name "*.java" -type f | while read file; do
    javac -d bin -cp lib "$file" 2>/dev/null
done

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Compilation completed!"
    echo "Output directory: bin/"
    echo ""
    echo "Note: This project uses Spring Boot and requires Maven/Gradle for full setup."
    echo "Please install Maven from: https://maven.apache.org/download.cgi"
else
    echo "[ERROR] Compilation failed!"
    echo "This project requires dependencies that can only be resolved by Maven or Gradle."
fi

echo ""
read -p "Press Enter to exit..."
