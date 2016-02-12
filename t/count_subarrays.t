#!/usr/bin/env perl
use 5.20.2;
use feature 'postderef';
use strict;
use warnings;

use Test::More::Behaviour;

my @test1 = (
    5, 
    [1, 2, 3, 4, 5], 
    9
);
        
require_ok('count_subarrays.pl');

describe "Count Subarrays " =>  sub {
    it "should return a count of all non-decreasing \
        subarrays in a given array " => sub {
        # Test 1
        my $result = &Practice::CodeChef::countSubArrays($test1[1]->@*);
        ok( $result eq $test1[2], 
            "countSubArrays result $result should be \
            equal to number of subarrays in test1 $test1[2]" );
        return $result;
    };
};

done_testing();
