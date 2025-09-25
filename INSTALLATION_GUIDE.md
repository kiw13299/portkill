# PortKill Installation Verification Guide

This guide helps you verify that PortKill is working correctly after installation via different package managers.

## 📦 Installation Methods

### 1. Homebrew (macOS - Recommended)
```bash
# Add the tap
brew tap mr-tanta/portkill

# Install PortKill
brew install portkill

# Verify installation
portkill --version
```

### 2. Package Managers

#### Arch Linux (AUR)
```bash
# Using yay
yay -S portkill

# Using paru  
paru -S portkill

# Manual installation
git clone https://aur.archlinux.org/portkill.git
cd portkill
makepkg -si
```

#### Ubuntu/Debian (.deb)
```bash
# Download and install
wget https://github.com/mr-tanta/portkill/releases/latest/download/portkill_2.3.1-1_all.deb
sudo dpkg -i portkill_2.3.1-1_all.deb

# Fix dependencies if needed
sudo apt-get install -f

# Alternative: Direct install from URL
curl -L https://github.com/mr-tanta/portkill/releases/latest/download/portkill_2.3.1-1_all.deb -o /tmp/portkill.deb && sudo dpkg -i /tmp/portkill.deb
```

#### RHEL/Fedora/SUSE (.rpm)
```bash
# Download and install
wget https://github.com/mr-tanta/portkill/releases/latest/download/portkill-2.3.1-1.noarch.rpm
sudo rpm -i portkill-2.3.1-1.noarch.rpm

# Or using dnf (Fedora)
sudo dnf install portkill-2.3.1-1.noarch.rpm

# Or using zypper (openSUSE)
sudo zypper install portkill-2.3.1-1.noarch.rpm
```

### 3. Manual Installation
```bash
# Quick install script
curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/install.sh | bash

# Manual installation
git clone https://github.com/mr-tanta/portkill.git
cd portkill
chmod +x bin/portkill
sudo cp bin/portkill /usr/local/bin/
```

## ✅ Verification Tests

After installation, run these commands to verify PortKill is working correctly:

### Basic Functionality Test
```bash
# Check version
portkill --version
# Expected: PortKill 2.3.1

# Show help
portkill --help
# Expected: Display help message with usage instructions

# Test configuration
portkill --verbose --dry-run list
# Expected: Show available ports without making changes
```

### Advanced Feature Tests
```bash
# Test process listing
portkill list

# Test with a known port (if available)
portkill list 22  # SSH port (usually active)

# Test benchmarking feature
portkill benchmark 80 google.com

# Test interactive menu
portkill menu
```

### Package-Specific Verification

#### For Package Installations (deb/rpm)
```bash
# Check installed files
# Debian/Ubuntu:
dpkg -L portkill

# RHEL/Fedora:
rpm -ql portkill

# Verify configuration file
ls -la /etc/portkill/portkill.conf

# Check documentation
ls -la /usr/share/doc/portkill/
```

#### For Homebrew Installation
```bash
# Check installation location
which portkill
# Expected: /opt/homebrew/bin/portkill (Apple Silicon) or /usr/local/bin/portkill (Intel)

# Check Homebrew info
brew info portkill

# List installed files
brew list portkill
```

## 🔧 Configuration Verification

### Default Configuration
```bash
# Check if config file exists and is readable
if [ -f /etc/portkill/portkill.conf ]; then
    echo "✅ Configuration file found"
    head -5 /etc/portkill/portkill.conf
else
    echo "⚠️ Configuration file not found (using defaults)"
fi
```

### Log Directory
```bash
# Check log directory (package installations only)
ls -la /var/log/portkill/ 2>/dev/null || echo "Log directory not created yet"
```

## 🧪 Functional Testing

### Test with a Mock Service
```bash
# Start a simple test server
python3 -m http.server 8999 &
TEST_PID=$!

# Test PortKill functionality
portkill list 8999
portkill --dry-run 8999
portkill --interactive 8999

# Clean up
kill $TEST_PID
```

### Performance Testing
```bash
# Test local benchmarking
portkill benchmark 80 localhost

# Test remote benchmarking
portkill benchmark 443 github.com

# Test with custom parameters
portkill benchmark 80 google.com 5 2 3  # 5 tests, 2 concurrent, 3s timeout
```

## 🚨 Troubleshooting

### Common Issues

#### Command Not Found
```bash
# Check PATH
echo $PATH | grep -E "(usr/local/bin|opt/homebrew/bin)"

# Find portkill location
find /usr -name portkill 2>/dev/null
find /opt -name portkill 2>/dev/null

# Add to PATH if needed
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc  # or ~/.zshrc
source ~/.bashrc  # or ~/.zshrc
```

#### Permission Issues
```bash
# Fix executable permissions
sudo chmod +x /usr/local/bin/portkill
# or
sudo chmod +x /usr/bin/portkill

# Fix ownership
sudo chown root:root /usr/local/bin/portkill
```

#### Missing Dependencies
```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install bash coreutils util-linux procps

# RHEL/Fedora
sudo dnf install bash coreutils util-linux procps-ng

# Optional dependencies
sudo apt-get install bc netcat lsof iproute2  # Debian/Ubuntu
sudo dnf install bc nmap-ncat lsof iproute    # RHEL/Fedora
```

### Package-Specific Issues

#### Debian/Ubuntu Issues
```bash
# Reinstall with force
sudo dpkg --force-confnew -i portkill_2.3.1-1_all.deb

# Check package status
dpkg -s portkill

# Remove and reinstall
sudo dpkg -r portkill
sudo dpkg -i portkill_2.3.1-1_all.deb
```

#### RPM-based Issues  
```bash
# Reinstall
sudo rpm -Uvh --force portkill-2.3.1-1.noarch.rpm

# Check package info
rpm -qi portkill

# Verify files
rpm -V portkill
```

#### AUR Issues
```bash
# Clean build
cd portkill-aur
makepkg --clean
makepkg -si

# Update checksums
updpkgsums
```

## 📊 Testing Report Template

Use this template to report installation success:

```
## Installation Test Report

**System Information:**
- OS: [e.g., Ubuntu 22.04, macOS 14.0, Arch Linux]
- Architecture: [e.g., x86_64, arm64]
- Shell: [e.g., bash 5.1, zsh 5.8]

**Installation Method:**
- [ ] Homebrew
- [ ] AUR (yay/paru)
- [ ] .deb package
- [ ] .rpm package
- [ ] Manual installation

**Test Results:**
- [ ] ✅ portkill --version works
- [ ] ✅ portkill --help displays correctly
- [ ] ✅ portkill list functions
- [ ] ✅ portkill benchmark works
- [ ] ✅ Configuration file accessible
- [ ] ✅ No permission issues

**Issues Found:**
[List any problems encountered]

**Additional Notes:**
[Any other relevant information]
```

## 🔄 Next Steps After Installation

1. **Read the Documentation**
   ```bash
   portkill --help
   man portkill  # If man page is available
   ```

2. **Customize Configuration**
   ```bash
   # Edit configuration file
   sudo nano /etc/portkill/portkill.conf
   ```

3. **Try Interactive Mode**
   ```bash
   portkill menu
   ```

4. **Set Up Aliases (Optional)**
   ```bash
   # Add to ~/.bashrc or ~/.zshrc
   alias pk='portkill'
   alias pkill='portkill'
   alias pklist='portkill list'
   ```

5. **Join the Community**
   - Report issues: https://github.com/mr-tanta/portkill/issues
   - Request features: https://github.com/mr-tanta/portkill/discussions
   - Contribute: https://github.com/mr-tanta/portkill/blob/main/CONTRIBUTING.md

## 📞 Support

If you encounter any issues:

1. Check this guide first
2. Search existing issues: https://github.com/mr-tanta/portkill/issues
3. Create a new issue with:
   - Your OS and version
   - Installation method used
   - Complete error messages
   - Steps to reproduce the problem

**Happy port managing! 🚀**