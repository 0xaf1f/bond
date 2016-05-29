Prerequisites
=============

* perl
  - Env::Path

Building the manpage requires pandoc.
If it's not available, installation will just proceed without it.

On Debian or Debian-derived systems like Ubuntu, the following will install the required dependencies:

	sudo apt-get install libenv-path-perl pandoc

Installation
============

	./configure
	make
	sudo make install

bond requires integration with your shell in order to work.
Doing the following will achieve this if you use bash.

	echo ". /usr/local/share/bond/init.sh" >> ~/.bashrc
