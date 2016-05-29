
EXTRA_DIST = LICENSE INSTALL.md

bin_PROGRAMS = bondcmd
bondcmd_SOURCES = bondcmd.pl

PANDOC = @PANDOC@
if HAVEPANDOC
man_MANS = bond.1
endif
EXTRA_DIST += bond.1.md

dist_pkgdata_DATA = init.sh

clean-local:
	$(RM) $(man_MANS)

SUFFIXES =

SUFFIXES += .pl
.pl:
	cp $< $@ && chmod +x $@

SUFFIXES += .md
.md:
	$(PANDOC) --from markdown --to man $< --standalone > $@
