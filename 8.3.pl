use strict;
use warnings;
use BeginPerlBioinfo; # see Chapter 6 about this module
use Kumar1;
# Initialize variables
my @file_data = ( );
my $dna = '';
my $protein = '';
# Read in the contents of the file "sample.dna"
my $file="sample.dna";
my $array_ref=readFileToArray($file);
@file_data = @$array_ref;
# Extract the sequence data from the contents of the file
#"sample.dna"
$dna = extract_sequence_from_fasta_data(@file_data);
# Translate the DNA to protein
$protein = dna2peptide($dna);
# Print the sequence in lines 25 characters long
print_sequence($protein, 25);
exit;


sub extract_sequence_from_fasta_data {
my(@fasta_file_data) = @_;
# Declare and initialize variables
my $sequence = '';
foreach my $line (@fasta_file_data) {
# discard blank line
if ($line =~ /^\s*$/) {
next;
# discard comment line
} elsif($line =~ /^\s*#/) {
next;
# discard fasta header line
} elsif($line =~ /^>/) {
next;
# keep line, add to sequence string
} else {
$sequence .= $line;
}
}
# remove non-sequence data (in this case, whitespace)
#from $sequence string
$sequence =~ s/\s//g;
return $sequence;

}

sub print_sequence {
my($sequence, $length) = @_;
# Print sequence in lines of $length
for ( my $pos = 0 ; $pos < length($sequence) ; $pos +=$length ) {
}
	print substr($sequence, $pos, $length), "\n";
}

sub dna2peptide {
my($dna) = @_;
use strict;
use warnings;
use BeginPerlBioinfo; # see Chapter 6 about this
module
# Initialize variables
my $protein = '';
IT-SC 188
# Translate each three-base codon to an amino acid, and
append to a protein
for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {
$protein .= codon2aa( substr($dna,$i,3) );
}
return $protein;
}