print "COMING UP... \n";
print "OUTPUT FOR EXERCISE 5.9\n\n";

$dna = "ATCGATCGTTA";
print "The DNA is: $dna\n";

print "Enter the position of the base you want to switch from: ";
chomp ($a = <>);
print "Enter the positon of the base you want to switch to: ";
chomp ($b = <>);

@dna = split('', $dna);

($d) = @dna[$a];
@dna[$a] = @dna[$b];
(@dna[$b]) = $d;

print "The DNA after switching the bases form $a position to $b position is: @dna";
