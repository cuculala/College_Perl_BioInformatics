
=comment
program to parse the SOD genes name
=cut
package Midterm2013_CSCI452;

use strict;
#Read input file names 


my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\MidTerm_452\\dataset\\";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @input_file= ();
my @input_file = readdir DIR;
closedir DIR;


shift @input_file;shift @input_file;
my @collections=();


foreach my $index (0..2){
	
	my $ref_array=readFileToArray($dir.$input_file[$index]);
	
	my $ref_genes =parse_genes_from_file($ref_array);
	
	push(@collections,keys %$ref_genes);
	writeHash($ref_genes,$out[$index]);
}	




frequent_patterns();
####################################################
# Subroutine unique_genes to extract unique genes array and write to a file
####################################################




{
	my $ref_unique = build_unique_genes(@collections);
}


# Subroutine frequent_patterns to deal with frequent pattern associated with the 390 genes
########################################################################################################

{
	
	my $ref_frequent_file = readFileToArray("frequent_match.txt");

	writeHash($ref,$output_frequent_genes);


	writeHash($hash_unique_freqentgene,"Kumar_unique_patterns_count.txt"); 
