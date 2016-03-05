#!/usr/bin/env perl
use 5.20.2;
use strict;
use warnings;

package Practice::CodeChef;

sub countSubArrays (@);

sub countSubArrays (@) {
    my @array = @_;
    my @subarrays = ();
    
    for (my $idx=0, my $end=@array; $idx < $end; $idx++) {
        my $elm = $array[$idx];
        my $more = 1;
        my @sub = ($elm);
        
        while (my $next = $array[$idx + $more]) {
        
            if ($idx == 0 && ($idx + $more) == $#array) {
                $more++;
                next;
                
            } elsif ($array[$idx + $more - 1] < $next) {
                push(@subarrays, [push(@sub, $next)]);
                say "\n @sub \n";
                $more++;
                next;
                
            } else {
                last;
            }
            
        }
    }
    
    return @subarrays;
}

1;
