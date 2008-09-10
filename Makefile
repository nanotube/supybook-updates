PARAMS=-a toc -a toclevels=3 -a date=$(shell date +%Y-%m-%d) -a numbered -d book
ifdef REVISION
PARAMS+=-a revision=$(REVISION)
#else
#PARAMS+=-a revision=$(shell git describe)
endif

all: index.html

pdf: index.pdf

%.html: %.txt
	asciidoc $(PARAMS) $<

%.pdf: %.txt
	a2x $(PARAMS) -f pdf $<

clean:
	@$(RM) index.html

.PHONY: all pdf
