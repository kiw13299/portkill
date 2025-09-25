# PortKill

A robust port management utility for macOS and Linux that simplifies the process of identifying and terminating processes occupying network ports.

## Overview

PortKill provides a streamlined interface for managing port conflicts during development. It eliminates the need to remember complex command sequences for finding and killing processes on specific ports.

## Features

- **Intelligent Process Detection**: Multiple fallback methods ensure reliable process identification
- **Safe Process Management**: System-critical processes are protected by default
- **Interactive Mode**: Terminal UI for visual port management
- **Process Tree Visualization**: Display hierarchical process relationships
- **Bulk Operations**: Manage multiple ports simultaneously
- **Real-time Monitoring**: Continuously monitor port activity
- **Cross-platform**: Works on macOS and Linux systems

## Installation

### Homebrew (Recommended)
```bash
brew tap mr-tanta/portkill
brew install portkill
```

### Manual Installation
```bash
curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/install.sh | bash
```

### From Source
```bash
git clone https://github.com/mr-tanta/portkill.git
cd portkill
make install
```

## Usage

### Basic Commands

Kill processes on a port (default):
```bash
portkill 3000
```

Kill processes on multiple ports:
```bash
portkill 3000 8080 9000
```

Kill processes on a port range:
```bash
portkill 3000-3005
```

List processes on a port:
```bash
portkill list 3000
```

Monitor ports in real-time:
```bash
portkill monitor 3000 8080
```

Show process tree for a port:
```bash
portkill tree 3000
```

Show process tree with custom depth:
```bash
portkill tree --depth 3 8080
```

### Advanced Usage

Interactive mode:
```bash
portkill menu
```

Scan all listening ports:
```bash
portkill scan
```

Dry-run mode (preview actions):
```bash
portkill --dry-run 3000
```

Force termination:
```bash
portkill --force 3000
```

Interactive confirmation:
```bash
portkill --interactive 8080
```

### Command Reference

| Command | Description | Example |
|---------|-------------|---------|
| *default* | Kill processes on port(s) | `portkill 3000` |
| `list` | Show processes on port(s) | `portkill list 3000` |
| `tree` | Show process tree hierarchy | `portkill tree 3000` |
| `scan` | Display all listening ports | `portkill scan` |
| `monitor` | Real-time port monitoring | `portkill monitor 3000 8080` |
| `menu` | Launch interactive interface | `portkill menu` |

### Options

| Flag | Description |
|------|-------------|
| `--force`, `-f` | Use SIGKILL instead of SIGTERM |
| `--dry-run`, `-n` | Preview actions without executing |
| `--interactive`, `-i` | Confirm each action |
| `--verbose`, `-v` | Detailed output |
| `--quiet`, `-q` | Minimal output |

## Configuration

PortKill stores configuration in `~/.portkill/`:

```
~/.portkill/
├── config.conf      # User preferences
├── whitelist.conf   # Protected processes
└── portkill.log     # Operation history
```

### Protected Processes

System-critical processes are protected by default. Customize the whitelist by editing `~/.portkill/whitelist.conf`.

## Performance

Benchmarks on macOS 14.0 (M1):
- Process identification: ~80ms
- Process termination: ~120ms
- Port scan (all ports): ~2.3s

## Uninstall

### Automatic Removal
```bash
curl -sSL https://raw.githubusercontent.com/mr-tanta/portkill/main/uninstall.sh | bash
```

### Manual Removal
```bash
# Standard installation location
sudo rm /usr/local/bin/portkill

# Or find and remove from PATH
which portkill | xargs sudo rm
```

### Homebrew
```bash
brew uninstall portkill
```

## Requirements

- macOS 10.12+ or Linux kernel 3.10+
- Bash 3.2+
- Standard Unix utilities (lsof, ps, kill)

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License. See [LICENSE](LICENSE) for details.

## Author

Abraham Esandayinze Tanta

---

For bug reports and feature requests, please use the [issue tracker](https://github.com/mr-tanta/portkill/issues).