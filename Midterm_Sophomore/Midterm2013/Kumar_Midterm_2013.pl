
=comment
program to parse the SOD genes name
=cut

use strict;
#Read input file names 

my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\dataset";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @input_file= ();
my @input_file = readdir DIR;
closedir DIR;


shift @input_file;shift @input_file; #to remove two files with names .. ,and .

my @collections=();

foreach my $index (0..2){
	
	my $ref_array=readFileToArray($dir.$input_file[$index]);
	printArray($ref_array);
	my $ref_genes =parse_genes_from_file($ref_array);
	push(@collections,$ref_genes);
	#writeArray($ref_genes,$out[$index]);
}	

# my $ref_unique = build_unique_genes(@collections);
# writeArray($ref_unique,$unique_gene_filename);

# my $ref_frequent_file = readFileToArray("sample.txt");;
# writeHash($ref_hash,$output_frequent_genes);