.PHONY: test install env

ifeq ($(MAKECMDGOALS),install)
    ifeq "$(shell bpan version 2>/dev/null)" ""
	$(error 'BPAN not installed. See http://bpan.org')
    endif
endif

DIR = test
LIB = lib/test/tap.bash
DOC = doc/test-tap.md
MAN3 = man/man3/test-tap.3

INSTALL_LIB=$(shell bpan env BPAN_LIB)
INSTALL_MAN3=$(shell bpan env BPAN_MAN3)

default: help

help:
	@echo 'Rules: test, install, doc'

test:
	prove $(PROVEOPT:%=% )test/

install:
	install -C -d -m 0755 $(INSTALL_LIB)/$(DIR)/
	install -C -m 0755 $(LIB) $(INSTALL_LIB)/$(DIR)/
	install -C -d -m 0755 $(INSTALL_MAN3)/
	install -C -m 0644 $(MAN3) $(INSTALL_MAN3)/

doc: $(MAN3)

man/man3/%.3: doc/%.md
	ronn --roff < $< > $@
