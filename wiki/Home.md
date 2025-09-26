# PortKill Wiki

Welcome to the comprehensive PortKill documentation! PortKill is a lightweight, zero-dependency port management tool that follows the Unix philosophy of "do one thing and do it well."

## 🚀 Quick Navigation

### Getting Started
- [Installation Guide](Installation.md) - How to install PortKill
- [Quick Start](Quick-Start.md) - Get up and running in minutes
- [Basic Commands](Basic-Commands.md) - Essential PortKill commands

### Core Features
- [Port Management](Port-Management.md) - Kill, list, and monitor ports
- [Process Detection](Process-Detection.md) - How PortKill finds processes
- [Docker Integration](Docker-Integration.md) - Managing containerized applications
- [JSON Output](JSON-Output.md) - Automation-friendly structured data

### Advanced Usage
- [Interactive Menu](Interactive-Menu.md) - Terminal-based user interface
- [Performance Benchmarking](Performance-Benchmarking.md) - Test port connectivity
- [Security Scanning](Security-Scanning.md) - Identify vulnerable services
- [Process Trees](Process-Trees.md) - Visualize process relationships
- [Port Monitoring](Port-Monitoring.md) - Real-time port surveillance
- [Bulk Operations](Bulk-Operations.md) - Manage multiple ports efficiently

### Reference
- [Command Reference](Command-Reference.md) - Complete command documentation
- [Configuration](Configuration.md) - Environment variables and settings
- [Troubleshooting](Troubleshooting.md) - Common issues and solutions
- [FAQ](FAQ.md) - Frequently asked questions

### Development
- [Contributing](Contributing.md) - How to contribute to PortKill
- [Architecture](Architecture.md) - Internal design and structure
- [Testing](Testing.md) - Running tests and validation
- [Release Process](Release-Process.md) - How releases are made

### Comparisons & Background
- [Tool Comparison](Tool-Comparison.md) - PortKill vs alternatives
- [Design Philosophy](Design-Philosophy.md) - Why we chose simplicity
- [Version History](Version-History.md) - Changes and evolution

## 📊 PortKill at a Glance

| Metric | Value |
|--------|--------|
| **Size** | 72KB |
| **Lines of Code** | 2,106 |
| **Dependencies** | Zero (pure Bash) |
| **Platforms** | macOS, Linux, Unix systems |
| **License** | MIT |
| **First Release** | 2023 |

## 🔧 System Requirements

- **Shell**: Bash 4.0 or later
- **OS**: macOS, Linux, or any Unix-like system
- **Tools**: Standard Unix utilities (lsof, ps, kill, netstat)
- **Optional**: Docker (for container management)
- **Optional**: bc (for advanced benchmarking calculations)

## 💡 Philosophy

PortKill follows the Unix philosophy:

> **Do one thing and do it well.**

In an era of bloated tools requiring multiple dependencies, PortKill stands out by:

- ✅ **Zero Dependencies** - Pure Bash, no Python/Node.js/Go required
- ✅ **Lightweight** - 200x smaller than alternatives
- ✅ **Reliable** - Simple code means fewer bugs
- ✅ **Portable** - Works anywhere Bash exists
- ✅ **Fast** - No startup overhead from heavy runtimes

## 📈 Use Cases

### Developers
- Kill stuck development servers
- Clear port conflicts during local development
- Debug networking issues
- Integrate into build scripts

### System Administrators
- Manage production services
- Clean up orphaned processes
- Monitor system resources
- Automate maintenance tasks

### DevOps Engineers
- Container orchestration cleanup
- CI/CD pipeline integration
- Infrastructure monitoring
- Security auditing

## 🏆 Why PortKill?

| Feature | PortKill | Alternatives |
|---------|----------|-------------|
| Size | 72KB | ~14MB+ |
| Dependencies | None | Python, Node.js, Go |
| Startup Time | Instant | 100ms+ |
| Memory Usage | <1MB | 50MB+ |
| Installation | Single file | Package managers |
| Reliability | Rock solid | Dependency issues |

## 📚 Additional Resources

- [GitHub Repository](https://github.com/mr-tanta/portkill)
- [Issue Tracker](https://github.com/mr-tanta/portkill/issues)
- [Homebrew Formula](https://github.com/mr-tanta/homebrew-portkill)
- [License (MIT)](https://github.com/mr-tanta/portkill/blob/main/LICENSE)

---

**Need help?** Check our [FAQ](FAQ.md) or [open an issue](https://github.com/mr-tanta/portkill/issues) on GitHub.