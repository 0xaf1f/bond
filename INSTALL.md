Prerequisites
=============

The program only requires Perl.
Building the manpage requires pandoc.
If it's not available, installation will just proceed without it.

Installation
============

	./configure
	make
	sudo make install

bond requires integration with your shell in order to work.
Doing the following will achieve this if you use bash.

	echo ". /usr/local/share/bond/init.sh" >> ~/.bashrc
