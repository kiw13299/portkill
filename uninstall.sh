#!/bin/bash

# PortKill Uninstall Script
# Copyright (c) 2025 Abraham Esandayinze Tanta

set -e

VERSION="2.0.0"
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="portkill"

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_colored() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}" >&2
}

print_header() {
    echo >&2
    print_colored "$BLUE" "PortKill Uninstaller v$VERSION"
    print_colored "$BLUE" "===================================="
    echo >&2
}

check_installation() {
    if ! command -v "$SCRIPT_NAME" &> /dev/null; then
        print_colored "$YELLOW" "PortKill is not installed or not in PATH"
        exit 0
    fi
    
    local install_path=$(which "$SCRIPT_NAME" 2>/dev/null)
    if [[ -z "$install_path" ]]; then
        print_colored "$YELLOW" "PortKill installation not found"
        exit 0
    fi
    
    print_colored "$BLUE" "Found PortKill installation at: $install_path"
    echo "$install_path"
}

confirm_uninstall() {
    local install_path=$1
    
    echo >&2
    print_colored "$YELLOW" "This will remove PortKill from your system:"
    echo "  • $install_path" >&2
    echo >&2
    
    read -p "Are you sure you want to uninstall PortKill? (y/N): " -n 1 -r >&2
    echo >&2
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_colored "$BLUE" "Uninstall cancelled"
        exit 0
    fi
}

remove_portkill() {
    local install_path=$1
    
    print_colored "$BLUE" "Removing PortKill..."
    
    # Check if we need sudo
    if [[ ! -w "$(dirname "$install_path")" ]]; then
        print_colored "$YELLOW" "Root access required to remove from $(dirname "$install_path")"
        if sudo rm -f "$install_path"; then
            print_colored "$GREEN" "PortKill removed successfully"
        else
            print_colored "$RED" "Error: Failed to remove PortKill"
            exit 1
        fi
    else
        if rm -f "$install_path"; then
            print_colored "$GREEN" "PortKill removed successfully"
        else
            print_colored "$RED" "Error: Failed to remove PortKill"
            exit 1
        fi
    fi
}

verify_removal() {
    if command -v "$SCRIPT_NAME" &> /dev/null; then
        print_colored "$RED" "Warning: PortKill may still be available in PATH"
        print_colored "$YELLOW" "You may need to restart your shell or check other installation locations"
    else
        print_colored "$GREEN" "PortKill has been completely removed from your system"
    fi
}

cleanup_message() {
    echo >&2
    print_colored "$BLUE" "Cleanup complete!"
    echo >&2
    print_colored "$BLUE" "Thank you for using PortKill!"
    echo "If you encountered any issues, please report them at:" >&2
    echo "https://github.com/mr-tanta/portkill/issues" >&2
    echo >&2
}

main() {
    print_header
    
    # Check if PortKill is installed
    install_path=$(check_installation)
    
    # Confirm uninstall
    confirm_uninstall "$install_path"
    
    # Remove PortKill
    remove_portkill "$install_path"
    
    # Verify removal
    verify_removal
    
    # Show cleanup message
    cleanup_message
}

# Handle interrupts
trap 'echo; print_colored "$YELLOW" "Uninstall cancelled"; exit 130' INT

# Run uninstaller
main "$@"