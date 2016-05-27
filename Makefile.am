
bin_PROGRAMS = bondcmd
bondcmd_SOURCES = bondcmd.pl

man_MANS = bond.1
EXTRA_DIST = bond.1.md # Automake isn't used to manpages having to be generated.

dist_pkgdata_DATA = init.sh

clean-local:
	$(RM) $(man_MANS)

SUFFIXES =

SUFFIXES += .pl
.pl:
	cp $< $@ && chmod +x $@

SUFFIXES += .md
.md:
	pandoc --from markdown --to man $< --standalone > $@
