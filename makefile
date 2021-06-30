# Cockpit Navigator - A File System Browser for Cockpit.
# Copyright (C) 2021 Josh Boudreau <jboudreau@45drives.com>

# This file is part of Cockpit Navigator.
# Cockpit Navigator is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# Cockpit Navigator is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with Cockpit Navigator.  If not, see <https://www.gnu.org/licenses/>.

default:
	

all: default

install:
	mkdir -p $(DESTDIR)/usr/share/cockpit/
	cp -rpf navigator $(DESTDIR)/usr/share/cockpit
ifeq ($(DIST),"el7")
	sed -i "s/pf-c-button/btn/g;s/pf-m-primary/btn-primary/g;s/pf-m-secondary/btn-default/g;s/pf-m-danger/btn-danger/g" $(DESTDIR)/usr/share/cockpit/navigator/navigator.html
endif

uninstall:
	rm -rf $(DESTDIR)/usr/share/cockpit/navigator

install-local:
	mkdir -p $(HOME)/.local/share/cockpit
	cp -rpf navigator $(HOME)/.local/share/cockpit
	sed -i "s#\"/usr/share/\(cockpit/navigator/scripts/.*\)\"#\"$(HOME)/.local/share/\1\"#g" $(HOME)/.local/share/cockpit/navigator/navigator.js

make uninstall-local:
	rm -rf $(HOME)/.local/share/cockpit/navigator
