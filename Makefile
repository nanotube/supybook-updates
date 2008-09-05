all: index.html

%.html: %.txt
	asciidoc -a toc -a toclevels=3 -d book $<

clean:
	@$(RM) index.html

.PHONY: all
