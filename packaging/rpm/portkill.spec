Name:           portkill
Version:        2.3.1
Release:        1%{?dist}
Summary:        Advanced port management and network analysis tool
License:        MIT
URL:            https://github.com/mr-tanta/portkill
Source0:        https://github.com/mr-tanta/portkill/archive/v%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  bash

Requires:       bash >= 4.0
Requires:       coreutils
Requires:       util-linux
Requires:       procps-ng

Recommends:     bc
Recommends:     nmap-ncat
Recommends:     lsof
Recommends:     iproute

%description
PortKill is a powerful command-line utility for managing network ports and
analyzing system processes. It provides comprehensive port management
capabilities including:

- Kill processes by port number with multiple signal options
- List and monitor active processes on specific ports
- Real-time port monitoring and process tree visualization
- Port scanning and security analysis
- Performance benchmarking for local and remote ports
- Historical analytics and export capabilities
- Interactive menu-driven interface

PortKill supports both IPv4 and IPv6, handles port ranges, and includes
safety features to protect system processes. It's designed for system
administrators, developers, and security professionals who need reliable
port management tools.

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
* Wed Sep 25 2024 mr-tanta <your-email@example.com> - 2.3.0-1
- Added port performance benchmarking feature
- Enhanced process tree visualization
- Improved security scanning capabilities
- Added historical analytics and export options
- Added interactive menu mode
- Performance optimizations and bug fixes

* Wed Sep 25 2024 mr-tanta <your-email@example.com> - 2.2.2-1
- Bug fixes and stability improvements
- Enhanced error handling
- Improved cross-platform compatibility

* Wed Sep 25 2024 mr-tanta <your-email@example.com> - 2.0.0-1
- Initial RPM package release
- Complete rewrite with advanced features
- Added comprehensive port management capabilities