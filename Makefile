all: index.html

%.html: %.txt
	asciidoc -a toc -d book $<

clean:
	@$(RM) index.html

.PHONY: all
