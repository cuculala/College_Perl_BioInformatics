use Kumar;
use strict;

my $file = "hell.txt";

my $ref_array=readFileToArray($file);
printArray($ref_array);
printArrayUnsorted($ref_array);
my $out = "heaven.txt";
writeArray($ref_array,$out);

my $ref_hash = readFileToHash($file);
printHash($ref_hash);
printHashUnsorted($ref_hash);
writeHash($ref_hash,"ktv.txt");


