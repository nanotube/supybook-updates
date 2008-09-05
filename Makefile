all: index.html

%.html: %.txt
	asciidoc -d book $<

clean:
	@$(RM) index.html

.PHONY: all
