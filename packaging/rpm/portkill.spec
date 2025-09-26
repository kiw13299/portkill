Name:           portkill
Version:        3.0.0
Release:        1%{?dist}
Summary:        Lightweight, zero-dependency port management tool following Unix philosophy
License:        MIT
URL:            https://github.com/mr-tanta/portkill
Source0:        https://github.com/mr-tanta/portkill/archive/v%{version}.tar.gz

BuildArch:      noarch

Requires:       bash >= 4.0
Requires:       coreutils
Requires:       util-linux
Requires:       procps-ng

Recommends:     bc
Recommends:     nmap-ncat
Recommends:     lsof
Recommends:     iproute

%description
PortKill is a lightweight, zero-dependency port management tool that follows
the Unix philosophy of "do one thing and do it well". This is the v3.0.0
SIMPLIFICATION RELEASE that returns to PortKill's core mission of reliable
port management without bloat.

Key features:
- Zero dependencies: Pure Bash with standard Unix utilities only
- Lightweight: 200x smaller than alternatives (72KB total)
- Reliable: Simpler code means fewer bugs
- Fast: Instant startup, no runtime overhead
- Docker integration: Handles containers automatically
- Process safety: Protection for system processes
- JSON output: Machine-readable format for automation
- Interactive menu: User-friendly terminal interface

Strategic positioning as PortKill Core - the foundation for future
enterprise features while maintaining rock-solid reliability.

%prep
%setup -q

%build
# Nothing to build for shell script

%install
rm -rf $RPM_BUILD_ROOT

# Create directories
mkdir -p $RPM_BUILD_ROOT%{_bindir}
mkdir -p $RPM_BUILD_ROOT%{_sysconfdir}/portkill
mkdir -p $RPM_BUILD_ROOT%{_docdir}/%{name}
mkdir -p $RPM_BUILD_ROOT%{_datadir}/doc/%{name}

# Install main script
install -m 755 bin/portkill $RPM_BUILD_ROOT%{_bindir}/portkill

# Install configuration file
install -m 644 portkill.conf $RPM_BUILD_ROOT%{_sysconfdir}/portkill/portkill.conf

# Install documentation
install -m 644 README.md $RPM_BUILD_ROOT%{_docdir}/%{name}/README.md
install -m 644 CONTRIBUTING.md $RPM_BUILD_ROOT%{_docdir}/%{name}/CONTRIBUTING.md
install -m 644 LICENSE $RPM_BUILD_ROOT%{_docdir}/%{name}/LICENSE

# Install scripts as documentation
install -m 644 install.sh $RPM_BUILD_ROOT%{_docdir}/%{name}/install.sh
install -m 644 uninstall.sh $RPM_BUILD_ROOT%{_docdir}/%{name}/uninstall.sh

%files
%defattr(-,root,root,-)
%{_bindir}/portkill
%config(noreplace) %{_sysconfdir}/portkill/portkill.conf
%{_docdir}/%{name}/README.md
%{_docdir}/%{name}/CONTRIBUTING.md
%{_docdir}/%{name}/LICENSE
%{_docdir}/%{name}/install.sh
%{_docdir}/%{name}/uninstall.sh

%post
# Create log directory
mkdir -p /var/log/portkill
chmod 755 /var/log/portkill

echo "PortKill has been installed successfully!"
echo "Run 'portkill --help' to get started."
echo ""
echo "Configuration file: /etc/portkill/portkill.conf"
echo "Documentation: %{_docdir}/%{name}/"

%preun
# Stop any running portkill processes
pkill -f "portkill" 2>/dev/null || true

%postun
if [ $1 -eq 0 ]; then
    # Remove log directory on complete uninstall
    rm -rf /var/log/portkill 2>/dev/null || true
fi

%changelog
* Thu Sep 26 2024 mr-tanta <your-email@example.com> - 3.0.0-1
- SIMPLIFICATION RELEASE - Back to Unix Roots
- Zero dependencies: Pure Bash with standard Unix utilities only
- Lightweight: Reduced from 3,371 to 2,106 lines (38% smaller)
- Faster startup: Instant execution, no runtime overhead
- Maintained Docker integration and process safety features
- Removed web dashboard, WebSocket support, and remote SSH operations
- Strategic positioning as PortKill Core for future three-tier strategy
- Fixed ShellCheck warnings and updated version handling

* Wed Sep 25 2024 mr-tanta <your-email@example.com> - 2.2.2-1
- Bug fixes and stability improvements
- Enhanced error handling
- Improved cross-platform compatibility

* Wed Sep 25 2024 mr-tanta <your-email@example.com> - 2.0.0-1
- Initial RPM package release
- Complete rewrite with advanced features
- Added comprehensive port management capabilities