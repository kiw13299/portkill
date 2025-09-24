#!/bin/bash

# PortKill Demo Script
# This script demonstrates PortKill's key features
# Record this with asciinema or terminalizer for a GIF

echo "PortKill Demo - Advanced Port Management"
echo "========================================="
echo
sleep 2

echo "1. Check what's using port 3000:"
echo "$ portkill list 3000"
portkill list 3000
sleep 3

echo
echo "2. Kill process on port 3000:"
echo "$ portkill kill 3000"
# portkill kill 3000  # Uncomment when you have something on port 3000
sleep 3

echo
echo "3. Scan all listening ports:"
echo "$ portkill scan"
portkill scan | head -20
sleep 3

echo
echo "4. Monitor multiple ports in real-time:"
echo "$ portkill monitor 3000 8080 5000"
echo "(Press Ctrl+C to stop monitoring)"
# timeout 5 portkill monitor 3000 8080 5000
sleep 3

echo
echo "5. Interactive menu mode:"
echo "$ portkill menu"
echo "(Interactive interface launches...)"
sleep 2

echo
echo "PortKill makes port management simple and safe!"
echo "Install: curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/install.sh | bash"
echo "GitHub: https://github.com/mr-tanta/portkill"