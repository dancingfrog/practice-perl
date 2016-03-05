#!/usr/bin/env perl6

#? How do you define, export and import packages 
unit package Practice::CodeChef;

sub countSubArrays (@array) {
    my @subarrays = ();
    
    loop (my $idx=0, my $end=@array; $idx < $end; $idx++) {
        my $elm = @array[$idx];
        my $more = 1;
        my @sub = ($elm);
        
        while (my $next = @array[$idx + $more]) {
        
            if ($idx == 0 && ($idx + $more) == (@array.elems - 1)) {
                $more++;
                next;
                
            } elsif (@array[$idx + $more - 1] < $next) {
                @subarrays.push([@sub, $next]);
                @sub.push($next);
                say "\n" ~ @sub ~ "\n";
                $more++;
                next;
                
            } else {
                last;
            }
            
        }
    }
    
    return @subarrays.elems;
}

# For now, test function here by calling it as a method on an array
(1, 2, 3, 4, 5).&countSubArrays;
