#!/usr/bin/env perl
use 5.10.1;
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
        push(@subarrays, [@sub,]);
        
        while (my $next = $array[$idx + $more]) {
        
            #if ($idx == 0 && ($idx + $more) == $#array) {
            #    $more++;
            #    next;
            #    
            #} els
            if ($array[$idx + $more - 1] < $next) {
                push(@subarrays, [push(@sub, $next)]);
                #say "\n @sub \n";
                $more++;
                next;
                
            } else {
                last;
            }
            
        }
    }
    
    return @subarrays;
}

if ($ARGV[0]) {
    open my $input, '<', $ARGV[0]
        or die "Could not open input: $!\n";
    
    my ($tests) = <$input> =~ /(\d+)/;
    #say "Testing $tests cases\n";
    my $elements = undef;
    
    while (<$input>) {
        unless (!$elements) {
            my @array = split " ", $_;
            if (@array) {
                say "". countSubArrays(@array);
            }
            $elements = undef;
        } elsif (($elements) = $_ =~ /^(\d+)$/) {
            next;
        }
    }
    
    close $input
        or die "Could not close input: $!\n";
} else {
    my ($tests) = <STDIN> =~ /(\d+)/;
    #say "Testing $tests cases\n";
    my $elements = undef;
    
    while ($tests && defined (my $in = <STDIN>)) {
        
        unless (!$elements) {
            my @array = split " ", $in;
            if (@array) {
                say "". countSubArrays(@array);
            }
            $tests--;
        } elsif (($elements) = $in =~ /^(\d+)$/) {
            next;
        }
        $elements = undef;
    }
}

1;
