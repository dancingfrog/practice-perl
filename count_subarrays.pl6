#!/usr/bin/env perl6

#? How do I define, export and import packages 
unit package Practice::CodeChef;

sub countSubArrays (@array) {
    my @subarrays = ();
    
    loop (my $idx=0, my $end=@array; $idx < $end; $idx++) {
        my $elm = @array[$idx];
        my $more = 1;
        my @sub = ($elm);
        @subarrays.push([@sub,]);
        
        while (my $next = @array[$idx + $more]) {
        
            #if ($idx == 0 && ($idx + $more) == (@array.elems - 1)) {
                # In this case do not count full array as subarray
            #    $more++;
            #    next;
            #    
            #} els
            if (@array[$idx + $more - 1] < $next) {
                @subarrays.push([@sub.push($next),]);
                #@sub.say;
                $more++;
                next;
                
            } else {
                last;
            }
            
        }
    }
    
    return @subarrays.elems;
}

if (@*ARGS[0]) {
    my $input = open @*ARGS[0], :r 
        or die "Could not open input: $!\n";
 
    my ($cases) = $input.get ~~ /(\d+)/;
    #say "Testing $cases cases\n";
    my $elements = 0;
    
    while (defined my $in = $input.get) {
        $elements = $elements.Int;
        
        if ($elements > 0) {
            my @array = split " ", $in;
            if (@array) {
                say countSubArrays(@array);
            }
        } elsif (($elements) = $in ~~ /^(\d+)$/) {
            next;
        }
        $elements = 0;
    }

    close $input
        or die "Could not close input: $!\n";
}
