#!/usr/bin/env perl6

#? How do I define, export and import packages in Perl6?
unit package Practice::CodeChef;

sub countSubArrays (@array) {
    my @subarrays = ();

    loop (my $idx=0, my $end=@array; $idx < $end; $idx++) {
        my $elm = @array[$idx];
        my $more = 1;
        my @sub = ($elm);
        @subarrays.push([@sub,]);

        while (my $next = @array[$idx + $more]) {

            # if ($idx == 0 && ($idx + $more) == (@array.elems - 1)) {
            #    # In this case do not count full array as subarray
            #    $more++;
            #    next;
            #
            # } els
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

    my ($tests) = $input.get ~~ /(\d+)/;
    #say "Testing $tests cases\n";
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
} else {
    my ($tests) = $*IN.get ~~ /(\d+)/;
    #say "Testing $tests cases\n";
    my $elements = 0;

    while ($tests && defined my $in = $*IN.get) {
        $elements = $elements.Int;

        if ($elements > 0) {
            my @array = split " ", $in;
            if (@array) {
                say countSubArrays(@array);
            }
            $tests -= 1;
        } elsif (($elements) = $in ~~ /^(\d+)$/) {
            next;
        }
        $elements = 0;
    }
}
