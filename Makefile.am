
EXTRA_DIST = LICENSE INSTALL.md

bin_PROGRAMS = bondcmd
bondcmd_SOURCES = bondcmd.pl

PANDOC = @PANDOC@
if HAVEPANDOC
man_MANS = bond.1
endif
EXTRA_DIST += bond.1.md

dist_pkgdata_DATA = init.sh

# Automake seems to prevent the generation of a rule to figure out that
# bondcmd can be made from bondcmd.pl ...
bondcmd$(EXEEXT): $(bondcmd_SOURCES)

clean-local:
	$(RM) $(man_MANS)

SUFFIXES =

SUFFIXES += $(EXEEXT) .pl
.pl$(EXEEXT):
	cp $< $@ && chmod +x $@

SUFFIXES += .md
.md:
	$(PANDOC) --from markdown --to man $< --standalone > $@
