
=comment
program to parse the SOD genes nameAuthor : Kumar lamaDate : 10/19/2013
=cut

use strict;use Kumar;
#Read input file names 
my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\dataset";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @input_file = readdir DIR;
closedir DIR;

shift @input_file;shift @input_file; #to remove two files with names .. ,and .
my @out = qw(Kumar_SOD_CU_ZN_1-Genes.txt Kumar_SOD_CU_ZN_2-Genes.txt Kumar_SOD_MN-Genes.txt);

foreach my $file (0..2){
	
	my $ref_array=readFileToArray($input_file[$file]);
	
	my $ref_genes =parse_genes_from_file($ref_array);
	writeArray($ref_genes,$out[$file]);	
}	

=beginmy $out = "heaven.txt";
writeArray($ref_array,$out);

my $ref_hash = readFileToHash($file);
printHash($ref_hash);
printHashUnsorted($ref_hash);
writeHash($ref_hash,"ktv.txt");
=end
