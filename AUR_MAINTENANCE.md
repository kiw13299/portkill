# PortKill AUR Submission & Maintenance Guide

This guide covers the complete process for submitting and maintaining the PortKill package on the Arch User Repository (AUR).

## 📋 Prerequisites Completed

✅ **AUR Package Files Ready:**
- `PKGBUILD` with correct dependencies and build instructions
- `.SRCINFO` file generated and verified  
- SHA256 checksum confirmed: `d65211fa00e3d9c993b1acbff91d2449afc51f97083f479f4a0840b71ec32f60`
- Package structure tested and verified

✅ **Account Setup Required:**
- Create AUR account at https://aur.archlinux.org
- Add SSH public key: `ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMCJOJopRy1UcEeB5zf3ZW70f1tnXI5nrOGPtsMqoFq3 abraham@tantainnovatives.com`

## 🚀 Step-by-Step Submission Process

### 1. Account Setup (One-time)
```bash
# 1. Register at https://aur.archlinux.org
# 2. Go to "My Account" → "SSH Public Keys"
# 3. Add your SSH key (provided above)
# 4. Verify email address
```

### 2. Initial Package Submission
```bash
# Navigate to prepared AUR directory
cd ../portkill-aur

# Verify everything is ready
./verify-aur-setup.sh

# Initialize git repository
git init
git remote add origin ssh://aur@aur.archlinux.org/portkill.git

# Test SSH connection (should show fingerprint)
ssh -T aur@aur.archlinux.org
# Expected: SHA256:RFzBCUItH9LZS0cKB5UE6ceAYhBD5C8GeOBip8Z11+4

# Submit package
git add PKGBUILD .SRCINFO
git commit -m "Initial import: PortKill v2.3.1 - Advanced port management tool

- Advanced port management and network analysis tool
- Supports port killing, monitoring, and benchmarking
- Interactive menu-driven interface
- Performance testing capabilities
- Cross-platform compatibility (Linux/macOS)"

git push -u origin master
```

### 3. Verify Submission
After successful push:
- Visit: https://aur.archlinux.org/packages/portkill
- Package should appear in search results
- Users can install with: `yay -S portkill` or `paru -S portkill`

## 🔄 Package Updates Process

### For New Releases (e.g., v2.3.2)

1. **Update Package Files:**
```bash
cd ../portkill-aur

# Update PKGBUILD
# - Change pkgver=2.3.2
# - Reset pkgrel=1 
# - Update sha256sum with new release checksum

# Get new checksum
curl -sL https://github.com/mr-tanta/portkill/archive/v2.3.2.tar.gz | sha256sum

# Update PKGBUILD with new checksum
nano PKGBUILD
```

2. **Generate New .SRCINFO:**
```bash
# Install makepkg if on Arch Linux
makepkg --printsrcinfo > .SRCINFO

# Or manually update .SRCINFO to match PKGBUILD changes
```

3. **Submit Update:**
```bash
git add PKGBUILD .SRCINFO
git commit -m "Update to v2.3.2

- Add new features/fixes from release
- Update dependencies if needed
- Verify functionality on latest Arch"

git push
```

## 🧪 Testing AUR Package

### Local Testing (on Arch Linux)
```bash
# Clone and test build
git clone https://aur.archlinux.org/portkill.git portkill-test
cd portkill-test

# Test package build
makepkg -s

# Install locally for testing
makepkg -si

# Verify installation
portkill --version
portkill --help
portkill list

# Remove test package
sudo pacman -Rs portkill
```

### User Installation Commands
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

## 📦 Package Information

### Current Package Details
- **Package Name:** portkill
- **Version:** 2.3.1
- **Maintainer:** mr-tanta
- **Architecture:** any (shell script)
- **License:** MIT
- **Dependencies:** bash, coreutils, util-linux, procps-ng
- **Optional Dependencies:** bc, netcat, lsof, iproute2

### File Structure After Installation
```
/usr/bin/portkill                    # Main executable
/etc/portkill/portkill.conf         # Configuration file
/usr/share/doc/portkill/            # Documentation
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── install.sh
└── uninstall.sh
```

## 🛠️ Maintenance Responsibilities

### Regular Maintenance Tasks

1. **Monitor Issues:**
   - Check AUR package comments: https://aur.archlinux.org/packages/portkill
   - Respond to user questions and bug reports
   - Update package when issues are reported

2. **Version Updates:**
   - Update within 24-48 hours of new GitHub releases
   - Test new versions before pushing updates
   - Update dependencies if upstream changes require them

3. **Arch Linux Compatibility:**
   - Test on current Arch Linux releases
   - Update dependencies if package names change
   - Ensure compatibility with system updates

### Emergency Updates
```bash
# For critical fixes or security updates
cd ../portkill-aur

# Make necessary changes
nano PKGBUILD
makepkg --printsrcinfo > .SRCINFO

# Quick update
git add PKGBUILD .SRCINFO
git commit -m "Urgent: Fix critical issue

- Brief description of the fix
- Reference to GitHub issue if applicable"

git push
```

## 📧 Community Management

### Handling User Feedback

1. **AUR Comments:**
   - Respond within 24-48 hours
   - Be helpful and professional
   - Provide clear solutions or workarounds

2. **Common Issues & Solutions:**
   - **Build failures:** Check dependencies and PKGBUILD syntax
   - **Runtime issues:** Verify upstream GitHub issues
   - **Feature requests:** Direct users to GitHub repository

### Communication Templates

**For Version Updates:**
```
Updated to v2.3.x - includes new features and bug fixes.
Please report any issues at: https://github.com/mr-tanta/portkill/issues
```

**For Build Issues:**
```
Thanks for the report! This appears to be related to [specific issue].
Please try: [solution]
If the issue persists, please share the full build log.
```

## 🔍 Quality Assurance

### Pre-submission Checklist
- [ ] PKGBUILD follows Arch packaging standards
- [ ] All dependencies are correctly specified
- [ ] SHA256 checksum is accurate
- [ ] .SRCINFO matches PKGBUILD exactly
- [ ] Package builds successfully
- [ ] Installed package works correctly
- [ ] Version numbers are consistent

### Testing Commands
```bash
# Syntax check
bash -n PKGBUILD

# Build test
makepkg -s

# Installation test
sudo pacman -U *.pkg.tar.xz

# Functionality test
portkill --version
portkill list
portkill --help
```

## 📞 Support & Resources

### AUR Guidelines
- Follow the [AUR Submission Guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
- Read the [PKGBUILD Guidelines](https://wiki.archlinux.org/title/PKGBUILD)
- Understand [Arch Package Guidelines](https://wiki.archlinux.org/title/Arch_package_guidelines)

### Useful Commands
```bash
# Check package in AUR
yay -Ss portkill

# Get package info
yay -Si portkill

# Check for updates
yay -Syu

# Remove package
yay -Rs portkill
```

### Contact Information
- **GitHub Issues:** https://github.com/mr-tanta/portkill/issues
- **AUR Package:** https://aur.archlinux.org/packages/portkill
- **Email:** abraham@tantainnovatives.com (for urgent matters)

## 🎯 Success Metrics

Track these metrics for package success:
- **Installation Count:** AUR popularity
- **User Feedback:** Comments and ratings
- **Issue Resolution:** Response time and quality
- **Update Frequency:** Keeping package current
- **Community Engagement:** Active maintenance

---

## 🚀 Ready to Submit!

Everything is prepared for AUR submission:

1. **Complete account setup** at https://aur.archlinux.org
2. **Add SSH key** to your AUR account
3. **Run the submission commands** from `../portkill-aur/`
4. **Monitor the package** after submission

Once submitted, PortKill will be available to all Arch Linux users via:
```bash
yay -S portkill
paru -S portkill
```

**Good luck with the submission! 🎉**