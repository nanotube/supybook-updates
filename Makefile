PARAMS=-a toc -a toclevels=3 -a date=$(shell date +%Y-%m-%d) -a numbered -d book

all: index.html

pdf: index.pdf

%.html: %.txt
	asciidoc $(PARAMS) $<

%.pdf: %.txt
	a2x $(PARAMS) -f pdf $<

clean:
	@$(RM) index.html

.PHONY: all pdf
