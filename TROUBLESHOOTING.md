# PortKill Troubleshooting Guide

This guide helps you resolve common installation and runtime issues with PortKill.

## 🚨 **Most Common Issues**

### Issue 1: "Missing required commands: lsof netstat"

**Error Message:**
```
portkill --help
[!] Missing required commands: lsof netstat
Please install missing dependencies and try again
```

**Solution:**

#### For AUR Installation (Arch Linux):
The latest AUR package (v2.3.1-2) automatically installs all dependencies. If you're seeing this error:

```bash
# Update your AUR package
yay -Syu portkill

# Or reinstall completely
yay -Rs portkill
yay -S portkill
```

#### For Manual Installation or Other Distros:

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install lsof net-tools
```

**RHEL/CentOS/Fedora:**
```bash
sudo dnf install lsof net-tools
# Or on older systems:
sudo yum install lsof net-tools
```

**openSUSE:**
```bash
sudo zypper install lsof net-tools
```

**macOS:**
```bash
# Usually pre-installed, but if missing:
brew install lsof
```

---

### Issue 2: "No such file or directory" (Log Directory Error)

**Error Message:**
```
/usr/bin/portkill: line 93: /home/username/.portkill/portkill.log: No such file or directory
```

**Solution:**
This is fixed in PortKill v2.3.2+. To resolve:

#### If using AUR:
```bash
# Update to latest version
yay -Syu portkill
```

#### If using manual installation:
```bash
# Create the directory manually as a temporary fix
mkdir -p ~/.portkill

# Or reinstall with the latest version
curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/install.sh | bash
```

---

### Issue 3: Permission Denied

**Error Message:**
```bash
portkill: command not found
# OR
permission denied: portkill
```

**Solutions:**

1. **Check if portkill is in PATH:**
```bash
which portkill
# Should show: /usr/bin/portkill or /usr/local/bin/portkill
```

2. **Fix permissions:**
```bash
sudo chmod +x /usr/bin/portkill
# Or
sudo chmod +x /usr/local/bin/portkill
```

3. **Add to PATH (if needed):**
```bash
# Add to ~/.bashrc or ~/.zshrc
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

### Issue 4: Can't Kill Certain Processes

**Error Message:**
```
[!] Failed to kill process 1234 (Operation not permitted)
```

**Solutions:**

1. **Use with sudo for system processes:**
```bash
sudo portkill 80
sudo portkill 443
```

2. **Enable force mode:**
```bash
portkill --force 3000
```

3. **Check if process is protected:**
```bash
portkill list 22  # SSH is typically protected
```

---

## 🔍 **Diagnostic Commands**

### Check PortKill Installation
```bash
# Verify version
portkill --version
# Expected: PortKill 2.3.2

# Test basic functionality
portkill --help

# Check dependencies
which lsof && echo "lsof: OK" || echo "lsof: MISSING"
which netstat && echo "netstat: OK" || echo "netstat: MISSING"
```

### Verify Configuration
```bash
# Check config directory
ls -la ~/.portkill/
# Should show: config.conf, history.log, portkill.log, whitelist.conf

# View current config
cat ~/.portkill/config.conf
```

### Test Core Functions
```bash
# List all ports (safe command)
portkill list

# Test on a known port (usually safe)
portkill list 22  # SSH port

# Run in verbose mode for debugging
portkill --verbose list
```

---

## 🛠️ **System-Specific Issues**

### Arch Linux
```bash
# Missing base-devel group
sudo pacman -S --needed base-devel

# AUR helper not working
sudo pacman -S yay
# OR
sudo pacman -S paru
```

### Ubuntu/Debian
```bash
# Repository issues
sudo apt-get update
sudo apt-get install -f

# Missing essential tools
sudo apt-get install build-essential curl wget
```

### RHEL/CentOS/Fedora
```bash
# Enable EPEL repository (RHEL/CentOS)
sudo dnf install epel-release

# Missing development tools
sudo dnf groupinstall "Development Tools"
```

### macOS
```bash
# Command line tools missing
xcode-select --install

# Homebrew issues
brew doctor
brew update
```

---

## 📊 **Performance Issues**

### Slow Port Scanning
```bash
# Use specific port instead of scanning all
portkill list 3000

# Reduce timeout
portkill benchmark 3000 localhost 5 1 2  # 2 second timeout
```

### High Memory Usage
```bash
# Check process tree depth
portkill tree --depth 3 8080  # Limit depth

# Use quiet mode
portkill --quiet 3000
```

---

## 🔧 **Advanced Troubleshooting**

### Debug Mode
```bash
# Enable verbose logging
portkill --verbose --dry-run list

# Check log file
tail -f ~/.portkill/portkill.log
```

### Reset Configuration
```bash
# Backup current config
cp -r ~/.portkill ~/.portkill.backup

# Reset to defaults
rm -rf ~/.portkill

# Run portkill to regenerate config
portkill --help
```

### Check Network Stack
```bash
# Test network commands directly
lsof -iTCP -sTCP:LISTEN
netstat -tulpn
ss -tulpn  # Modern alternative
```

---

## 📞 **Getting Help**

### Before Reporting Issues
1. **Check this troubleshooting guide**
2. **Update to the latest version**
3. **Test with verbose mode**: `portkill --verbose list`
4. **Gather system information**:
```bash
uname -a                    # System info
portkill --version         # PortKill version
which portkill             # Installation location
lsof --version 2>&1        # Dependencies
netstat --version 2>&1
```

### Report Issues
1. **GitHub Issues**: https://github.com/mr-tanta/portkill/issues
2. **AUR Comments**: https://aur.archlinux.org/packages/portkill
3. **Include**: 
   - Operating system and version
   - Installation method used
   - Complete error message
   - Output of diagnostic commands above

### Community Support
- **ArchWiki**: Search for port management topics
- **Forums**: Post in relevant Linux distribution forums
- **Reddit**: r/archlinux, r/linux, r/sysadmin

---

## ✅ **Verification Checklist**

After resolving issues, verify everything works:

- [ ] `portkill --version` shows correct version
- [ ] `portkill --help` displays without errors
- [ ] `portkill list` shows available ports
- [ ] Dependencies available: `which lsof && which netstat`
- [ ] Configuration directory exists: `ls ~/.portkill/`
- [ ] No permission errors when running commands
- [ ] Can kill test processes: `portkill --dry-run 3000`

---

## 🎯 **Prevention Tips**

1. **Keep PortKill Updated**:
```bash
# AUR users
yay -Syu portkill

# Manual installation users  
curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/install.sh | bash
```

2. **Regular System Updates**:
```bash
# Keep system dependencies current
sudo pacman -Syu     # Arch
sudo apt update && sudo apt upgrade  # Ubuntu/Debian
sudo dnf update      # Fedora
```

3. **Monitor AUR Comments**: Check https://aur.archlinux.org/packages/portkill for community-reported issues

---

**🚀 Most issues are resolved by updating to the latest version and ensuring all dependencies are installed!**