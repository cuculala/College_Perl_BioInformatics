
use strict;
use warnings;
use Kumar1;
use BeginPerlBioinfo; 

# see Chapter 6 about this module
# Initialize variables

my @file_data = ( );
my $dna = '';
my $revcom = '';
my $protein = '';

# Read in the contents of the file "sample.dna"
my $file="sample.dna";
my $array_ref=readFileToArray($file);
@file_data = @$array_ref;

# Extract the sequence data from the contents of the file
#"sample.dna"

$dna = extract_sequence_from_fasta_data(@file_data);

# Translate the DNA to protein in six reading frames
# and print the protein in lines 70 characters long
print "\n -------Reading Frame 1--------\n\n";
$protein = translate_frame($dna, 1);
print_sequence($protein, 70);
print "\n -------Reading Frame 2--------\n\n";
$protein = translate_frame($dna, 2);
print_sequence($protein, 70);

print "\n -------Reading Frame 3--------\n\n";
$protein = translate_frame($dna, 3);
print_sequence($protein, 70);
# Calculate reverse complement
$revcom = revcom($dna);
print "\n -------Reading Frame 4--------\n\n";
$protein = translate_frame($revcom, 1);
print_sequence($protein, 70);
print "\n -------Reading Frame 5--------\n\n";
$protein = translate_frame($revcom, 2);
print_sequence($protein, 70);
print "\n -------Reading Frame 6--------\n\n";
$protein = translate_frame($revcom, 3);
print_sequence($protein, 70);
exit;

sub revcom {
my($dna) = @_;
# First reverse the sequence
my($revcom) = reverse($dna);
# Next, complement the sequence, dealing with upper and
#lower case
# A->T, T->A, C->G, G->C
$revcom =~ tr/ACGTacgt/TGCAtgca/;
return $revcom;
}

sub translate_frame {
my($seq, $start, $end) = @_;
my $protein;

# To make the subroutine easier to use, you won't need
#to specify
# the end point--it will just go to the end of the
#sequence
# by default.
unless($end) {
$end = length($seq);
}
# Finally, calculate and return the translation
	return dna2peptide ( substr ( $seq, $start - 1,
$end -$start + 1) );
}

sub extract_sequence_from_fasta_data {
my(@fasta_file_data) = @_;
use strict;
use warnings;
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


sub dna2peptide {
my($dna) = @_;
my $file="sample.dna";
my $array_ref=readFileToArray($file);

# Initialize variables
my $protein = '';
for(my $i=0; $i < (length($dna) - 2) ; $i += 3) {
$protein .= codon2aa(substr($dna,$i,3) );
}
return $protein;
}

sub print_sequence {
my($sequence, $length) = @_;
# Print sequence in lines of $length
for ( my $pos = 0 ; $pos < length($sequence) ; $pos +=$length ) {

	print substr($sequence, $pos, $length), "\n";
}
}