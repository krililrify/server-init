#!/usr/bin/env bash

set -euo pipefail

# ============================================================
# Server Initialization Script
# Functions:
# 1. Update apt
# 2. Install curl
# 3. Install Docker
# 4. Enable / optimize BBR
# 5. Run host audit
# ============================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# ------------------------------------------------------------
# Root check
# ------------------------------------------------------------

if [ "$(id -u)" -ne 0 ]; then
    error "Please run this script as root."
    exit 1
fi

echo
echo "=============================================="
echo "       Linux Server Initialization"
echo "=============================================="
echo

# ------------------------------------------------------------
# Detect OS
# ------------------------------------------------------------

if [ -f /etc/os-release ]; then
    . /etc/os-release
    log "Detected OS: ${PRETTY_NAME:-Unknown}"
else
    warning "Unable to detect operating system."
fi

# ------------------------------------------------------------
# Step 1: Update apt
# ------------------------------------------------------------

echo
echo "----------------------------------------------"
echo "[1/5] Updating system packages"
echo "----------------------------------------------"

apt update

success "apt update completed."

# ------------------------------------------------------------
# Step 2: Install curl
# ------------------------------------------------------------

echo
echo "----------------------------------------------"
echo "[2/5] Installing curl"
echo "----------------------------------------------"

apt install -y curl

if command -v curl >/dev/null 2>&1; then
    success "curl installed successfully."
else
    error "curl installation failed."
    exit 1
fi

# ------------------------------------------------------------
# Step 3: Install Docker
# ------------------------------------------------------------

echo
echo "----------------------------------------------"
echo "[3/5] Installing Docker"
echo "----------------------------------------------"

log "Running Docker installation script..."

curl -fsSL \
    https://raw.githubusercontent.com/newxqkjfenxiang/docker-install/main/install-docker.sh \
    | bash

if command -v docker >/dev/null 2>&1; then
    success "Docker installed successfully."

    if systemctl is-active --quiet docker; then
        success "Docker service is running."
    else
        warning "Docker is installed but the service is not currently running."
    fi
else
    error "Docker installation failed."
    exit 1
fi

# ------------------------------------------------------------
# Step 4: BBR
# ------------------------------------------------------------

echo
echo "----------------------------------------------"
echo "[4/5] Enabling / optimizing BBR"
echo "----------------------------------------------"

log "Running BBR optimization script..."

bash <(curl -L -s https://sh.kinako.one/inits.sh)

success "BBR script completed."

# ------------------------------------------------------------
# Step 5: Host audit
# ------------------------------------------------------------

echo
echo "----------------------------------------------"
echo "[5/5] Running host audit"
echo "----------------------------------------------"

log "Running audit script..."

curl -fsSL \
    https://raw.githubusercontent.com/krililrify/jinzhi/main/audit-hosts.sh \
    | bash

success "Host audit completed."

# ------------------------------------------------------------
# Final
# ------------------------------------------------------------

echo
echo "=============================================="
echo "       Server Initialization Complete"
echo "=============================================="
echo

echo "Docker:"
docker --version 2>/dev/null || true

echo
echo "BBR:"
sysctl net.ipv4.tcp_congestion_control 2>/dev/null || true

echo
success "All tasks completed successfully."
echo
