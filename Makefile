
all: bondcmd

.SUFFIXES: .pl
.pl:
	cp $< $@ && chmod +x $@

.SUFFIXES: .md
.md:
	pandoc --from markdown --to man $< --standalone > $@
