version = 26

srcdir = .
VPATH = $(srcdir)

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# autoreload backend: inotify/nop
AUTORELOAD = inotify

# enable features requiring giflib (-lgif)
HAVE_GIFLIB = 1

# enable features requiring libexif (-lexif)
HAVE_LIBEXIF = 1

cflags = -std=c99 -Wall -pedantic $(CFLAGS)
cppflags = -I. $(CPPFLAGS) -D_XOPEN_SOURCE=700 \
  -DHAVE_GIFLIB=$(HAVE_GIFLIB) -DHAVE_LIBEXIF=$(HAVE_LIBEXIF) \
  -I/usr/include/freetype2 -I$(PREFIX)/include/freetype2

lib_exif_0 =
lib_exif_1 = -lexif
lib_gif_0 =
lib_gif_1 = -lgif
ldlibs = $(LDLIBS) -lImlib2 -lX11 -lXft -lfontconfig \
  $(lib_exif_$(HAVE_LIBEXIF)) $(lib_gif_$(HAVE_GIFLIB))

objs = autoreload_$(AUTORELOAD).o commands.o image.o main.o options.o \
  thumbs.o util.o window.o

all: topaz

.PHONY: all clean install uninstall
.SUFFIXES:
.SUFFIXES: .c .o
$(V).SILENT:

topaz: $(objs)
	@echo "LINK $@"
	$(CC) $(LDFLAGS) -o $@ $(objs) $(ldlibs)

$(objs): Makefile topaz.h commands.lst config.h
options.o: version.h

.c.o:
	@echo "CC $@"
	$(CC) $(cflags) $(cppflags) -c -o $@ $<

config.h:
	@echo "GEN $@"
	cp $(srcdir)/config.def.h $@

version.h: Makefile .git/index
	@echo "GEN $@"
	v="$$(cd $(srcdir); git describe 2>/dev/null)"; \
	echo "#define VERSION \"$${v:-$(version)}\"" >$@

.git/index:

clean:
	rm -f *.o topaz

install: all
	@echo "INSTALL bin/topaz"
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp topaz $(DESTDIR)$(PREFIX)/bin/
	chmod 755 $(DESTDIR)$(PREFIX)/bin/topaz
	@echo "INSTALL topaz.1"
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s!PREFIX!$(PREFIX)!g; s!VERSION!$(version)!g" topaz.1 \
		>$(DESTDIR)$(MANPREFIX)/man1/topaz.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/topaz.1
	@echo "INSTALL share/topaz/"
	mkdir -p $(DESTDIR)$(PREFIX)/share/topaz/exec
	cp exec/* $(DESTDIR)$(PREFIX)/share/topaz/exec/
	chmod 755 $(DESTDIR)$(PREFIX)/share/topaz/exec/*

uninstall:
	@echo "REMOVE bin/topaz"
	rm -f $(DESTDIR)$(PREFIX)/bin/topaz
	@echo "REMOVE topaz.1"
	rm -f $(DESTDIR)$(MANPREFIX)/man1/topaz.1
	@echo "REMOVE share/topaz/"
	rm -rf $(DESTDIR)$(PREFIX)/share/topaz

