CFLAGS=-O9 -fpic -Wall
LDFLAGS=-shared
LDLIBS=-lgpib -ltcl

gpiblib.so: gpiblib.c
	$(CC) $(LDFLAGS) $(CFLAGS) $< $(LDLIBS) -o $@