
####################################################
# Subroutine writeHash
####################################################
# Parameter
#	Reference to a hash
#	File name to write
# Return
#	Writes the sorted hash to a file 
####################################################
use strict;
use warnings;

sub writeHash{
	my ($refHash, $file) = @_;
	open(FH, ">$file")||die "can't open file $file";

	foreach my $key (sort keys %$refHash){
		print FH "$key\t$$refHash{$key}\n";
	}
	close FH;
}

####################################################
# Subroutine printHash
####################################################
# Parameter
#       Reference to a hash
# Return
#       Writes the sorted hash to screen 
####################################################

sub printHash{
        my ($refHash) = @_;
        my %hash=%$refHash;
        foreach my $key (sort keys %hash){
                print "$key\t$$refHash{$key}\n";
        }
}

sub printHashUnSort{
        my ($refHash) = @_;
        my %hash=%$refHash;
        foreach my $key (keys %hash){
                print "$key\t$$refHash{$key}\n";
        }
}


####################################################
# Subroutine writeArray
####################################################
# Parameter
#       Reference to an array
#       File name to write
# Return
#       Writes the sorted array to a file 
####################################################
sub writeArray{
        my ($refArray, $file) = @_;
        open(FH, ">$file")||die "can't open file $file";

        foreach my $element (sort @$refArray){
                print FH "$element\n";
        }
        close FH;
}




####################################################
# Subroutine printArray
####################################################
# Parameter
#	Reference to an array
# Return
#	Prints the sorted array on the screen
####################################################
sub printArray{
	my ($refArray) = @_;

	foreach my $element (sort @$refArray){
		print "$element\n";
	}
}

sub printArrayUnsorted{
	my ($refArray) = @_;
        
        
        print "Output using printArrayUnsorted subroutine\n";
	foreach my $element (@$refArray){
		print "$element\n";
	}
}



####################################################
# Subroutine readFileToArray
####################################################
# Parameter
#       File name to read
# Return
#       Reference to An array of lines
####################################################
sub readFileToArray{
	my ($file) = @_;
	my @array = ();
	open(FH, "$file")||die "can't open file $file";

	while(<FH>){
        	my $string = $_;
		chomp $string; #remove next line symbol
        	$string =~ s/^\s+//; #remove leading spaces
        	$string =~ s/\s+$//; #remove trailing spaces
		#print "$string\n";
		$string =~ s/\"//g; #remove " from the string if there is one
        	#print "$string\n";

        	push(@array, $string);
	}
	close FH;

	return \@array; #Return the array reference
}


####################################################
# Subroutine readFileToHash
####################################################
# Parameter
#       File name to read
# Return
#       Reference to a hash
####################################################
sub readFileToHash{
        my ($file) = @_;
        my %hash = ();
        open(FH, "$file")||die "can't open file $file";

        while(<FH>){
                my $string = $_;
                chomp $string; #remove next line symbol
                $string =~ s/^\s+//; #remove leading spaces
                $string =~ s/\s+$//; #remove trailing spaces
                #print "$string\n";
                $string =~ s/\"//g; #remove " from the string if there is one
                #print "$string\n";
                my ($key, @temp) = split("\t", $string);
                my $value = join("\t", @temp);
                $hash{$key} = $value;
        }
        close FH;

        return \%hash; #Return the hash reference
}

