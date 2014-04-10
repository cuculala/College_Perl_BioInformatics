#use strict;
use warnings;

my $fName="dataQuiz3.txt ";
my $array_ref = readFileToArray($fName);
srand(time||$$);
printArrayUnsort($array_ref);
$array_ref=shuffleArrayElement($array_ref);
printArrayUnsort($array_ref);

sub shuffleArrayElement {
my ($array)=@_;
my @array = @$array;
my @temp=();
my $element=();
my $ln
for (my $i=0;$i<scalar @array;$i++){
		$element =  rand int scalar @array;
		push(@temp,@array[$element]);
		splice(@array,$element,1);
	}
return \@temp;

}

sub random_data{
my ($data)=@_;	
	my @Adata = @$data;
	return $Adata[rand @Adata];
}


sub readFileToArray{
	my ($file) = @_;
	my @array = ();
	open(FH, "$file")||die "can't open file $file";

        print "Reading file: $file using readFileToArray subroutine\n";
	while(<FH>){
        	my $string = $_;
		chomp $string; #remove next line symbol
        	$string =~ s/^\s+//; #remove leading spaces
        	$string =~ s/\s+$//; #remove trailing spaces
		$string =~ s/\"//g; #remove " from the string if there is one
		
        	push(@array, $string);
	}
	close FH;

	return \@array; #Return the array reference
}


sub printArray{
	my ($refArray) = @_;
        my @array = @$refArray;
        
        print "Sorted using printArray subroutine\n";
	foreach my $element (sort @array){
		print "$element\n";
	}
}

sub printArrayUnsort{
	my ($refArray) = @_;
        
        
        print "Output using printArrayUnsorted subroutine\n";
	foreach my $element (@$refArray){
		print "$element\n";
	}
}
