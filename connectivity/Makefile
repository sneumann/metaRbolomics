DOCDIR=../docs

all: $(DOCDIR)/vn.html $(DOCDIR)/revDepNet.html $(DOCDIR)/packages.html

$(DOCDIR)/%.html: %.html
	cp $< $@
	rm -rf $(DOCDIR)/$*_files
	test -d $*_files && cp -r $*_files $(DOCDIR) || true

