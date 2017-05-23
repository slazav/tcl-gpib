CFLAGS=-O9 -fpic -Wall
LDFLAGS=-shared
LDLIBS=-lgpib -ltcl -lm

name=LibGpib
ver=1.3

dir=/usr$(subst ${prefix},,${libdir})/tcl

libgpib.so: gpib.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< $(LDLIBS) -o $@

pkgIndex.tcl: pkgIndex.tcl.in
	sed 's|%LIB_DIR%|${dir}|' $< > $@

install: libgpib.so pkgIndex.tcl
	mkdir -p ${libdir}/tcl/ ${datadir}/tcl/${name}-${ver}
	install -m644 libgpib.so   ${libdir}/tcl/
	install -m644 pkgIndex.tcl ${datadir}/tcl/${name}-${ver}
