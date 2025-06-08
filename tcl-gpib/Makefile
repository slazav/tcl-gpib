CFLAGS=-O9 -fpic -Wall `pkg-config --cflags tcl`
LDFLAGS=-shared   `pkg-config --libs-only-other tcl`
LDLIBS=-lgpib -lm `pkg-config --libs-only-l tcl`

name=LibGpib
ver=1.4

DESTDIR    ?=
prefix     ?= $(DESTDIR)/usr
bindir     ?= $(prefix)/bin
libdir     ?= $(prefix)/lib64
datadir    ?= $(prefix)/share
tcllibdir  ?= $(libdir)/tcl
tcldatadir ?= $(datadir)/tcl

libgpib.so: gpib.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< $(LDLIBS) -o $@

pkgIndex.tcl: pkgIndex.tcl.in
	sed 's|%LIB_DIR%|${dir}|;s|%VERSION%|${ver}|' $< > $@

install: libgpib.so pkgIndex.tcl
	mkdir -p ${tcllibdir} ${tcldatadir}/${name}-${ver}
	install -m644 libgpib.so   ${tcllibdir}
	install -m644 pkgIndex.tcl ${tcldatadir}/${name}-${ver}

clean:
	rm -f libgpib.so pkgIndex.tcl

