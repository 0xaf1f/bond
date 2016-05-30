#!/usr/bin/perl

use strict;
use warnings;

sub main {
    my $prefix = $ARGV[0];

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

    my $env_command;

    foreach my $var (keys %variables) {
	# Initialize empty variables to have a single colon.
	# This is important for variables like MANPATH, which use the extra
	# colon as a placeholder for the default search path.
	$ENV{$var} = ':' if !defined $ENV{$var};

	foreach my $element (@{$variables{$var}}) {
	    $ENV{$var} = "$prefix/$element:$ENV{$var}"
	}

	$env_command .= generate_export_cmd($var, $ENV{$var});
    }

    print $env_command;
}

sub generate_export_cmd {
    my (
	$variable,
	$value,
	) = @_;

    return "export $variable=\"$value\"\n";
}

exit(main(@ARGV));
