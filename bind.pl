#!/usr/bin/perl

use strict;
use warnings;

use Env::Path;

my $prefix = $ARGV[0];
#my $precedence = $ARGV[1];

my %variables = (
    PATH    => ['sbin', 'bin'],
    MANPATH => ['share/man'],
    LIBRARY_PATH => ['lib'],
    LD_LIBRARY_PATH => ['lib'],
    CPATH => ['include'],
    PERL5LIB => ['lib/perl5/site_perl'],
    PYTHONPATH => ['lib/python2.7/site-packages'],
    R_LIBS => ['lib/R/site-library'],
    );

foreach my $var (keys %variables) {
    foreach my $element (@{$variables{$var}}) {
	Env::Path->$var->Prepend("$prefix/$element");
    }
    print Env::Path->$var->Shell;
    print "\n";

}
