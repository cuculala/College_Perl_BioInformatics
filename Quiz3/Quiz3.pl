use Kumar;
#use strict;
use warnings;

my $fName="dataQuiz3.txt ";
my $array_ref = readFileToArray($fName);
srand(time||$$);
printArrayUnsort($array_ref);
$array_ref=shuffleArrayElement($array_ref);
printArrayUnsort($array_ref);
exit;
