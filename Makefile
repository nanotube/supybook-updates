PARAMS=-a toc -a toclevels=3 -a date=$(shell date +%Y-%m-%d) -a numbered -d book
ifdef VERSION
REVISION=$(VERSION)
endif
ifdef REVISION
PARAMS+=-a revision=$(REVISION)
#else
#PARAMS+=-a revision=$(shell git describe)
endif

all: index.html

pdf: index.pdf

release: clean all
ifndef VERSION
	@echo "Usage: make release VERSION=x"
	@false
else
	tar --owner=0 --group=0 --transform 's!^!supybook-$(VERSION)/!' -zcf supybook-$(VERSION).tar.gz index.txt index.html Makefile
endif

%.html: %.txt
	asciidoc $(PARAMS) $<

%.pdf: %.txt
	a2x $(PARAMS) -f pdf $<

clean:
	@$(RM) index.html

.PHONY: all pdf release release-tar
