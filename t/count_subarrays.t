#!/usr/bin/env perl
use 5.20.2;
use feature 'postderef';
use strict;
use warnings;
no warnings;

use Test::More::Behaviour;

my @test1 = (
    1, 
    [0], 
    1
);
my @test2 = (
    5, 
    [1, 2, 3, 4, 5], 
    15
);
my @test3 = (
    3, 
    [3, 2, 1], 
    3
);
my @test4 = (
    8, 
    [0, 1, 2, 3, 2, 1, 3, 4, 5], 
    21
);
        
require_ok('count_subarrays.pl');

describe "Count Subarrays " => sub {
    it "should return a count of all non-decreasing subarrays \
        with at least 1 element in the given array " => sub {
            my $result = 0;
            
            # Test 1
            $result = &Practice::CodeChef::countSubArrays($test1[1]->@*);
            ok $result eq $test1[2], 
                "countSubArrays result ($result) should be \
                equal to number of subarrays in test1 ($test1[2])";
            
            # Test 2
            $result = &Practice::CodeChef::countSubArrays($test2[1]->@*);
            ok $result eq $test2[2], 
                "countSubArrays result ($result) should be \
                equal to number of subarrays in test2 ($test2[2])";
            
            # Test 3
            $result = &Practice::CodeChef::countSubArrays($test3[1]->@*);
            ok $result eq $test3[2], 
                "countSubArrays result ($result) should be \
                equal to number of subarrays in test3 ($test3[2])";
            
            # Test 4
            $result = &Practice::CodeChef::countSubArrays($test4[1]->@*);
            ok $result eq $test4[2], 
                "countSubArrays result ($result) should be \
                equal to number of subarrays in test4 ($test4[2])";
            
        };
    };

done_testing();
