print "COMING UP... \n";
print "OUTPUT FOR EXERCISE 5.7\n\n";

$pf = "small.dna";
unless (open(PF, $pf))
{
	print "Cannot open file: $pf\n";
	exit;
}

$dna = <PF>;
@dna = split('',$dna);	
close PF;
print "The dna is @dna\n";
$c = 0;
$a = 0;
$l = length($dna);

while(@dna[$i] eq 'A'){$c ++;}
while(@dna[$i] eq 'C'){$c ++;}

$per = ($c/$l)*100;

print "The total number of GC are: $c\n";
print "The total number of bases are: $l \n";

print "The percentage of GC in DNA is: $per\%";

