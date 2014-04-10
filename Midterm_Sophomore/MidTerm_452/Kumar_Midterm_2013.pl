
=comment
program to parse the SOD genes nameAuthor : Kumar lamaDate : 10/19/2013
=cut
package Midterm2013_CSCI452;

use strict;use Kumar;
#Read input file names 


my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\MidTerm_452\\dataset\\";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @input_file= ();
my @input_file = readdir DIR;
closedir DIR;


shift @input_file;shift @input_file;my @out = qw(Kumar_SOD_CU_ZN_1-Genes.txt Kumar_SOD_CU_ZN_2-Genes.txt Kumar_SOD_MN-Genes.txt);
my @collections=();


foreach my $index (0..2){
	
	my $ref_array=readFileToArray($dir.$input_file[$index]);
	
	my $ref_genes =parse_genes_from_file($ref_array);
	
	push(@collections,keys %$ref_genes);
	writeHash($ref_genes,$out[$index]);
}	



unique_genes();
frequent_patterns();
####################################################
# Subroutine unique_genes to extract unique genes array and write to a file
####################################################


sub unique_genes

{	my $unique_gene_filename="Kumar_unique_genes_array.txt";
	my $ref_unique = build_unique_genes(@collections);	writeArray($ref_unique,$unique_gene_filename);
}

########################################################################################################
# Subroutine frequent_patterns to deal with frequent pattern associated with the 390 genes
########################################################################################################
sub frequent_patterns
{
		my $output_frequent_genes="Kumar_output_frequent_genes.txt";#frequent_match.txt
	my $ref_frequent_file = readFileToArray("frequent_match.txt");
	my $ref= parse($ref_frequent_file);
	writeHash($ref,$output_frequent_genes);
	my $hash_unique_freqentgene = counting($ref);   

	writeHash($hash_unique_freqentgene,"Kumar_unique_patterns_count.txt"); 
}
