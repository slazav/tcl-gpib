CFLAGS=-O9 -fpic -Wall
LDFLAGS=-shared
LDLIBS=-lgpib -ltcl

dir=/usr$(subst ${prefix},,${libdir})/tcl

libgpib.so: gpib.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< $(LDLIBS) -o $@

pkgIndex.tcl: pkgIndex.tcl.in
	sed 's|%LIB_DIR%|${dir}|' $< > $@

install: libgpib.so pkgIndex.tcl
	mkdir -p ${libdir}/tcl/ ${datadir}/tcl/gpib1.3
	install libgpib.so   ${libdir}/tcl/
	install pkgIndex.tcl ${datadir}/tcl/gpib1.3
