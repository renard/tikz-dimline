
PACKAGE=tikz-dimline
VERSION := $(shell git describe HEAD | cut -d- -f1)
XELATEX=xelatex -interaction nonstopmode -shell-escape -output-directory .

all: doc

doc:
	# Need to be compiled twice.
	$(XELATEX) tikz-dimline-doc.tex
	$(XELATEX) tikz-dimline-doc.tex

zip:
	git archive HEAD --prefix=$(PACKAGE)-$(VERSION)/ --format=zip > $(PACKAGE)-$(VERSION).zip

clean:
	rm -f *.{zip,aux,listing,log,out,pyg,toc}

dist-clean: clean
	rm -rf *.pdf
