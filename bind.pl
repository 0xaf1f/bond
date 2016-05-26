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

my $env_command = '';

foreach my $var (keys %variables) {
    foreach my $element (@{$variables{$var}}) {
	Env::Path->$var->Prepend("$prefix/$element");
    }
    my $next_entry = Env::Path->$var->Shell;

    # Work around an issue in Env::Path where
    # $var->Shell accumulates the shell commands from
    # the previous variable settings.
    my @available_entries = split(";\n",$env_command);
    foreach my $entry (@available_entries) {
	$next_entry =~ s/$entry//;
    }
    $env_command .= "$next_entry;\n";
}

print $env_command;
