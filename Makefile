#!/usr/bin/make
# Zur Erstellung des Debian-Pakets notwendig (make DESTDIR=/root/sophomorix)
# Created by Rüdiger Beck (jeffbeck-at-web.de)
DESTDIR=

SOURCES=$(DESTDIR)/etc/apt/sources.list.d
PREF=$(DESTDIR)/etc/apt/preferences.d


help:
	@echo ' '
	@echo 'Most common options of this Makefile:'
	@echo '-------------------------------------'
	@echo ' '
	@echo '   make help'
	@echo '      show this help'
	@echo ' '
	@echo '   make install'
	@echo '      install all stuff'
	@echo ' '
	@echo '   make deb'
	@echo '      create a debian package'
	@echo ' '


install:
	@echo '   * Installing acroread.list'
	@install -d -m755 -oroot -groot $(SOURCES)
	@install -oroot -groot --mode=0644 apt/acroread.list $(SOURCES)

	@echo '   * Installing acrroread.pref'
	@install -d -m755 -oroot -groot $(PREF)
	@install -oroot -groot --mode=0644 apt/acroread.pref $(PREF)


# build a package
deb:
	### deb
	@echo 'Did you do a dch -i ?'
	#@sleep 8
	dpkg-buildpackage -tc -uc -us -sa -rfakeroot
	@echo ''
	@echo 'Do not forget to tag this version in git'
	@echo ''


clean:
	# delete stuff after building package
