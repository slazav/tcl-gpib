%define teaname LibGpib
%define major 1.3

Name: tcl-gpib
Version: 1.3.2
Release: alt1

Summary: tcl-gpib interface from ROTA group
Group: System/Libraries
Source: %name-%version.tar
License: Unknown

Requires: tcl
BuildRequires: tcl-devel

%description
tcl-gpib interface from ROTA group

%prep
%setup -q

%build
%make

%install
%makeinstall

%files
%_tcllibdir/libgpib.so
%dir %_tcldatadir/%teaname-%major
%_tcldatadir/%teaname-%major/pkgIndex.tcl

%changelog
