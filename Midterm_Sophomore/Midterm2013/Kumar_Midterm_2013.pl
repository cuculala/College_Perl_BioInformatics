
=comment
program to parse the SOD genes nameAuthor : Kumar lamaDate : 10/19/2013
=cut

use strict;use Kumar;
#Read input file names 

my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\dataset";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @input_file= ();
my @input_file = readdir DIR;
closedir DIR;


shift @input_file;shift @input_file; #to remove two files with names .. ,and .
my @out = qw(Kumar_SOD_CU_ZN_1-Genes.txt Kumar_SOD_CU_ZN_2-Genes.txt Kumar_SOD_MN-Genes.txt);
my @collections=();

foreach my $index (0..2){
	
	my $ref_array=readFileToArray($dir.$input_file[$index]);
	printArray($ref_array);
	my $ref_genes =parse_genes_from_file($ref_array);
	push(@collections,$ref_genes);
	#writeArray($ref_genes,$out[$index]);
}	
# my $unique_gene_filename="unique_genes.txt";
# my $ref_unique = build_unique_genes(@collections);
# writeArray($ref_unique,$unique_gene_filename);
# my $output_frequent_genes="output_frequent_genes";
# my $ref_frequent_file = readFileToArray("sample.txt");;# my $ref_hash = parse_frequent_pattern($ref_frequent_file);
# writeHash($ref_hash,$output_frequent_genes);