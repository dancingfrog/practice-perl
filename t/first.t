#!/usr/bin/env perl
use 5.10.1;
use strict;
use warnings;

#use Test::More 'no_plan';
use Test::Simple tests => 1;

sub helloPerl;

print helloPerl;

ok( helloPerl() eq "Hello, Perl!\n", "should say Hello" );

#done_testing();

sub helloPerl {
	return "Hello, Perl!\n";
}
