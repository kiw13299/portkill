#!/bin/bash

# PortKill AUR Submission Script
# This script helps you submit PortKill to the AUR step by step

set -e

echo "🚀 PortKill AUR Submission Helper"
echo "=================================="
echo ""

# Check if we're in the right directory
if [[ ! -f "bin/portkill" ]]; then
    echo "❌ Error: Please run this script from the portkill-repo directory"
    exit 1
fi

echo "📋 Pre-submission Checklist:"
echo "1. ✅ AUR account created at https://aur.archlinux.org"
echo "2. ✅ SSH key added to AUR account"
echo "3. ✅ Package files prepared (PKGBUILD, .SRCINFO)"
echo ""

# Create AUR working directory
AUR_DIR="../portkill-aur"
echo "🏗️ Setting up AUR submission directory..."

if [[ -d "$AUR_DIR" ]]; then
    echo "🔄 Cleaning existing AUR directory..."
    rm -rf "$AUR_DIR"
fi

mkdir -p "$AUR_DIR"
cd "$AUR_DIR"

echo "📂 Copying AUR package files..."
cp "../portkill-repo/packaging/aur/PKGBUILD" .
cp "../portkill-repo/packaging/aur/.SRCINFO" .

echo "✅ Files copied successfully!"
echo ""

echo "📝 Package Information:"
echo "- Package Name: portkill"
echo "- Version: 2.3.1"
echo "- Architecture: any (shell script)"
echo "- License: MIT"
echo ""

echo "📋 Next steps to complete AUR submission:"
echo ""
echo "1. Initialize git repository:"
echo "   cd $AUR_DIR"
echo "   git init"
echo "   git remote add origin ssh://aur@aur.archlinux.org/portkill.git"
echo ""
echo "2. Verify SSH connection (should show Ed25519 fingerprint):"
echo "   ssh -T aur@aur.archlinux.org"
echo "   Expected: SHA256:RFzBCUItH9LZS0cKB5UE6ceAYhBD5C8GeOBip8Z11+4"
echo ""
echo "3. Submit package:"
echo "   git add PKGBUILD .SRCINFO"
echo "   git commit -m \"Initial import: PortKill v2.3.1 - Advanced port management tool\""
echo "   git push -u origin master"
echo ""
echo "4. Verify submission:"
echo "   Visit: https://aur.archlinux.org/packages/portkill"
echo ""

# Create a verification script
cat > verify-aur-setup.sh << 'EOF'
#!/bin/bash

echo "🔍 Verifying AUR setup..."

# Check SSH connection
echo "1. Testing SSH connection to AUR..."
if ssh -o ConnectTimeout=10 -T aur@aur.archlinux.org 2>&1 | grep -q "Hi"; then
    echo "   ✅ SSH connection successful"
else
    echo "   ❌ SSH connection failed - check your SSH key setup"
    exit 1
fi

# Verify files
echo "2. Verifying package files..."
if [[ -f "PKGBUILD" && -f ".SRCINFO" ]]; then
    echo "   ✅ Required files present"
    
    # Check PKGBUILD syntax
    if bash -n PKGBUILD; then
        echo "   ✅ PKGBUILD syntax valid"
    else
        echo "   ❌ PKGBUILD syntax error"
        exit 1
    fi
    
    # Verify checksum
    if grep -q "d65211fa00e3d9c993b1acbff91d2449afc51f97083f479f4a0840b71ec32f60" PKGBUILD; then
        echo "   ✅ SHA256 checksum correct"
    else
        echo "   ❌ SHA256 checksum mismatch"
        exit 1
    fi
else
    echo "   ❌ Missing required files"
    exit 1
fi

echo ""
echo "🎉 All checks passed! Ready to submit to AUR."
echo ""
echo "Run these commands to submit:"
echo "  git init"
echo "  git remote add origin ssh://aur@aur.archlinux.org/portkill.git"
echo "  git add ."
echo "  git commit -m \"Initial import: PortKill v2.3.1\""
echo "  git push -u origin master"
EOF

chmod +x verify-aur-setup.sh

echo "🛠️ Created verification script: $AUR_DIR/verify-aur-setup.sh"
echo ""
echo "🎯 Ready for AUR submission!"
echo "📍 Location: $AUR_DIR"
echo ""
echo "⚡ Quick start:"
echo "   cd $AUR_DIR"
echo "   ./verify-aur-setup.sh"
echo ""