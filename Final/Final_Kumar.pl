use Kumar1;
use strict;
use warnings;
use Final_Kumar;
my $directory="C:/Users/Kumar/Desktop/Dropbox/Mondal_Perl/Final/fileName.txt";
my $arrayFileName=readFileName($directory);

my ($arraybasemutation,$arrayAAmutation)=getMutation($arrayFileName);
my $arraybasemutated = getSample($arraybasemutation);
my $hashmutatedbase = frequencyDistribution($arraybasemutated);
my $fileMutatedbase = "Final_Kumar_base_Mutation.txt";
writeHash($hashmutatedbase,$fileMutatedbase);
	
my $arrayAAmutated = getSample($arrayAAmutation);
my $hashmutatedAA = frequencyDistribution($arrayAAmutated);
my $fileMutatedAA = "Final_Kumar_AA_Mutation.txt";
writeHash($hashmutatedAA,$fileMutatedAA);
exit;

