all: index.html

pdf: index.pdf

%.html: %.txt
	asciidoc -a toc -a toclevels=3 -d book $<

%.pdf: %.txt
	a2x -a toc -a toclevels=3 -d book -f pdf $<

clean:
	@$(RM) index.html

.PHONY: all pdf
