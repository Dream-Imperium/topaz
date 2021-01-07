PREFIX = /usr/local
ICONS  = 128x128.png

all:

install:
	for f in $(ICONS); do \
		dir="$(DESTDIR)$(PREFIX)/share/icons/hicolor/$${f%.png}/apps"; \
		mkdir -p "$$dir"; \
		cp "$$f" "$$dir/topaz.png"; \
		chmod 644 "$$dir/topaz.png"; \
	done
