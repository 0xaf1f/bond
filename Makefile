
all: bondcmd

.SUFFIXES: .pl
.pl:
	cp $< $@ && chmod +x $@
