
all: bind

.SUFFIXES: .pl
.pl:
	cp $< $@ && chmod +x $@
