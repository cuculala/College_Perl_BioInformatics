use strict;
use warnings;
use Kumar1; 

my $dna = "CGACGTCTTCGTACGGGACTAGCTCGTGTCGGTCGC";
my $protein = "";
my $codon;
my $fileDnaToAA="CodonToAminoAcid.txt";
my ($hash_ref)=readFileToHash($fileDnaToAA);
$fileDnaToAA="dna.txt";
my ($file_ref)= readFileToArray($fileDnaToAA);
my @array = @$file_ref;
for(my $i =0; $i < scalar @array;$i++){
		my $line =$array[$i];
		chomp $line;
		#print "$array[$i]\n";
		#if($line =~ /^#|>.*/){
		#	splice ( @array, $i, 0, $line);
		#}
}
#$dna = 	join('',@array);
for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {

$codon = substr($dna,$i,3);
$protein .= codon2aa($hash_ref,$codon);
}
print "I translated the DNA\n\n$dna\n\n into the
protein\n\n$protein\n\n";
exit;
