% BOND(1)
% Afif Elghraoui <afif@ghraoui.name>
% August 2024

# NAME

bond - change name space

# SYNOPSIS

**bond** *prefix*

# DESCRIPTION

**bond** activates a directory for use as an installation prefix.
It works by setting an array of standard environment variables so that installations to the given *prefix* can be directly used by standard tools with no further action.

# BUGS

Please see <https://gitlab.com/afif/bond/issues> for known issues or to report new ones.

# EXAMPLE

Prepare a directory to use as an installation prefix.

	mkdir local
	basedir="$PWD/local"

Bond it.

	bond "$basedir"

Install programs to this folder.
For any program you want to install, set the prefix to the bonded folder.

Perl module:

	perl Makefile.PL INSTALL_BASE="$basedir"
	make
	make install

Ruby gem:

	GEM_HOME="$basedir" gem install ...

Autoconfiscated package:

	./configure --prefix="$basedir"
	make
	make install

These packages should now be available for use within the current and any child shell as if they were centrally installed.

# SEE ALSO

http://man.cat-v.org/plan_9/1/bind

http://man.cat-v.org/plan_9/4/namespace

**module** (1)
