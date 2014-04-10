
####################################################
# Subroutine writeHash
####################################################
# Parameter
#	Reference to a hash
#	File name to write
# Return
#	Writes the sorted hash to a file 
####################################################


sub writeHash{
	my ($refHash, $file) = @_;
	open(FH, ">$file")||die "can't open file $file";

        print "Writing Hash to output file: Kumar_hashOutput.txt using writeHash subroutine\n";
        
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
        print "Output using printHash subroutine\n";
        foreach my $key (sort keys %$refHash){
                print "$key\t$$refHash{$key}\n";
        }
}

sub printHashUnsorted{
	my ($refHash) = @_;
        print "Output using printHashUnsorted subroutine\n";
        foreach my $key (keys %$refHash){
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
        print "Writing arra y to output file: $file using writeArray subroutine\n\n";

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
        
        
        print "Output using printArray subroutine\n";
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
	
	open(FH, '>$file')||die "can't open file $file";

        print "Reading file: $file using readFileToArray subroutine\n";
       
	while(<FH>){
        	my $string = $_;
        	
		chomp $string; #remove next line symbol
        	$string =~ s/^\s+//; #remove leading spaces
        	$string =~ s/\s+$//; #remove trailing spaces
		#print "$string\n";
		$string =~ s/\"//g; #remove " from the string if there is one
        	print "$string\n";
                
        	push(@array, $string);
	}
	close FH;
       
	return \@array; #Return the array reference
}



sub readFileToArray_prayas{
		my ($filename) = @_;
		unless (open(FILENAME, $filename))
		{
			print "Cannot open the file: $filename try again\n";
			exit;
		}
		
		my @data = <FILENAME>;
		chomp (@data);		
		return (\@data);
		}


####################################################
# Subroutine readFileToHash
####################################################
# Parameter
#       File name to read
# Return
#       Reference to a hash
####################################################
sub parse_genes_from_file {
      my ($array_ref)=@_;
      my @all_genes=();
      
      foreach $line (@$array_ref)  {
      chomp $line;
      print "$line";
      if ($line =~ m/^DR.*;$/){ #we operate on the line that begins with DR and ends with ';'
       
        my @split_line = split (/;/,$line); #split the line by ';'
               
        foreach my $element (@split_line){
                @temp_genes = split (/,/,$element);
                                
                if (@temp_genes[2] =~ /[TN]/ ){ # Only the genes that are T or N are wanted
                        @temp_genes[0] =~ s/^\s+//;
                        push(@all_genes,@temp_genes[0]."\t".@temp_genes[2]);
                }
                        
        }
                      
                      
     
     }
         
     }
      
     print "Number of genes in this file ",scalar @all_genes,"\n\n";
     return \@all_genes;
     
     }
     
     
sub build_unique_genes {
         (my @array_genes)=@_;
         %temp=();
         my @unique_genes = grep {! $temp{$_}++} @array_genes;
         return \@unique_genes;        
          
          
          
}          
        
 sub parse_frequent_pattern {
        
       (my $ref)=@_;
	my %hash=();
	my $temp_key;
	foreach my $line (@$ref)
	{
		if ($line =~ m/^>sp\|/)
		{
			my @gene_filters = split(/\|/,$line);
			$temp_key=@gene_filters[1];
			#print "$temp_key";
		}
		elsif($line =~ m/^\s+.*occurs frequently$/){
			my @lines = split(/\|/,$line);
			my @val = split(/\s\(pattern\)\s/,$lines[1]);
			my $val = $val[0];
			
			$hash{$temp_key}.=$val;
		}
		else{
			
		}
		return \%hash;
 }               
 }       
        
sub readFileToHash{
        my ($file) = @_;
        my %hash = ();
        open(FH, "$file")||die "can't open file $file";

        print "Reading file: data.txt using readFileToHash subroutine\n";

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

-1