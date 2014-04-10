use strict;


####################################################
# Subroutine readFileToArray
####################################################	
# Parameter
#       File name to read
# Return
#       Reference to An array of lines

sub readFileToArray{
		my ($filename) = @_;
		unless (open(FILENAME, $filename))
		{
			print "Cannot open the file: $filename\n";
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


sub readFileToHash{
		my($filename) = @_;
		my @line= ();
						
		unless (open(FILENAME, $filename))
		{
			print "Cannot open the file: $filename\n";
			exit;
		}
		
		my %aHash=();
		
		while(my $line=<FILENAME>)
			{			
				chomp $line;

				@line = split ('\s', $line);
				my $key = shift @line;
				my $value = join ("\t", @line); 
				$aHash{$key}=$value;
				#print "$key\t$aHash{$key}\n";
			}
		return (\%aHash);
        close FILENAME;
		}
		
		
			


####################################################
# Subroutine printArraySort
####################################################
# Parameter
#	Reference to an array
# Return
#	Prints the sorted array on the screen


sub printArraySort{
		my ($data) = @_;
		my @data = sort (@$data);	
		#print "The elements of the given file in sorted order as Array are:\n";	
		foreach my $element (@data)
		{
			print "$element\n";
		}
		}
		
####################################################
# Subroutine printArrayUnsort
####################################################
# Parameter
#	Reference to an array
# Return
#	Prints the sorted array on the screen


sub printArrayUnsort{
		my ($data) = @_;			
		foreach my $element (@$data)
		{
			print "$element\n";
		}
		}		

####################################################
# Subroutine printHashSort
####################################################
# Parameter
#       Reference to a hash
# Return
#       Writes the sorted hash to screen 

sub printHashSort{		
        my ($aHash) = @_;
		my %aHash = %$aHash;
		print "\nThe elements of the given file in sorted order as Hash are:\n";
        foreach my $key (sort keys %$aHash){
                print "$key\t$aHash{$key}\n";
        }
}

####################################################
# Subroutine printHashUnsort
####################################################
# Parameter
#       Reference to a hash
# Return
#       Writes the sorted hash to screen 

sub printHashUnsort{		
        my ($aHash) = @_;
		my %aHash = %$aHash;
		# print "\nThe elements of the given file in unsorted order as Hash are:\n";
        foreach my $key (keys %$aHash){
                print "$key\t$aHash{$key}\n";
        }
}


####################################################
# Subroutine writeArray
####################################################
# Parameter
#       Reference to an array
#       File name to write
# Return
#       Writes the unsorted array to the file 

sub writeArray{
		my ($writeArray, $data) = @_;
		unless (open(WA, ">$writeArray"))
		{
			print "Cannot open the file: $writeArray\n";
			exit;
		}
		print "Writing array to file: $writeArray\n\n";
		my @data = @$data;		
		
		foreach my $element (@data)
		{
			print WA "$element\n";
		}
		close WA;
		}


####################################################
# Subroutine writeArray_sort
####################################################
# Parameter
#       Reference to an array
#       File name to write
# Return
#       Writes the sorted array to the file 

sub writeArray_sort{
		my ($writeArray, $data) = @_;
		unless (open(WA, ">$writeArray"))
		{
			print "Cannot open the file: $writeArray\n";
			exit;
		}
		print "Writing array to file: $writeArray\n\n";
		my @data = @$data;
		sort @data;		
		
		foreach my $element (@data)
		{
			print WA "$element\n";
		}
		close WA;
		}

####################################################
# Subroutine writeHash
####################################################
# Parameter
#	Reference to a hash
#	File name to write
# Return
#	Writes the unsorted hash to the file 
sub writeHash{
	my ($writeHash, $aHash) = @_;
		unless (open(WH, ">$writeHash"))
		{
			print "Cannot open the file: $writeHash\n";
			exit;
		}
		print "Writing Hash to file: $writeHash\n";
		my %aHash = %$aHash;
		
	foreach my $key (keys %$aHash){
                print WH "$key\t$aHash{$key}\n";
        }
	close WH;
}


####################################################
# Subroutine writeHash_sort
####################################################
# Parameter
#	Reference to a hash
#	File name to write
# Return
#	Writes the sorted hash to the file 
sub writeHash_sort{
	my ($writeHash, $aHash) = @_;
		unless (open(WH, ">$writeHash"))
		{
			print "Cannot open the file: $writeHash\n";
			exit;
		}
		print "Writing Hash to file: $writeHash\n";
		my %aHash = %$aHash;
		
	foreach my $key (sort keys %$aHash){
                print WH "$key\t$aHash{$key}\n";
        }
	close WH;
}


#####################################
#Sub routine shuffle array elements
#####################################
# Parameter
#	Reference to array to be suffled
# Return
#	Reference to suffled array elements
sub shuffleArrayElement{
	my ($data) = @_;
	my @array;
	my @element = @$data;
		
	for (my $i = scalar(@element); $i > 0; $i--)
	{
		my $index = int(rand(scalar(@element)));
		@array[$i] = @element[$index];
		splice (@element, $index, 1);
	}
	
	return \@array;
	
	
}

####################################################
# Subroutine removeDuplicate
####################################################
# Parameter
#	Reference to a array of two elements
# Return
#	Reference to unique PPIs 
sub uniquePPIs{
		my ($ppi) = @_;
		my @ppi = @$ppi; #Array of raw PPIs
		my %hash = ();
		my @sortedPPI = (); #Array of sorted PPIs
		my %hashofPPI = (); #Hash of sorted PPIs
		
		
		for (my $i = 0; $i < scalar @ppi; $i++)  #removing the dulicate PPIs in different order like "a  b" and "b  a"
		{
			my $temp = $ppi[$i];
			my @new = sort split ('\t', $temp);
			# print "@new\n";
			my $sorted = join ("\t", @new);
			push (@sortedPPI, $sorted);				
		}
		
		foreach my $PPIelement (@sortedPPI)
		{
			$hashofPPI{$PPIelement}++;
		}
		
		my @fCleanned = keys %hashofPPI;
		return \@fCleanned;
	}


####################################################
# Subroutine uniqueProtein
####################################################
# Parameter
#	Reference to array of elements sepered by tab
# Return
#	Array of Unique elements 
sub uniqueProtein{
		my ($ppi) = @_;  #Array of cleanned PPIs
		my @ppi = @$ppi;
		my %hash = ();
		my @array = ();
		
		for (my $t = 0; $t < scalar @ppi; $t++)
		{
			my $w = $ppi[$t];
			my @first = split ("\t" , $w); #splitting two Protiens from a PPI
			my @array = push (@array, @first);  #putting both proteins in an array where each protein is an element
		}
		
		#print "@array\n";
		#print scalar @array, "\n";	
		
		
		foreach my $element (@array)
		{
			$hash{$element}++; #finding unique proteins using hash
		}
		
		#print "The total no. of elements in hash are: ", scalar keys %hash, "\n";
		print "Removing duplicate Proteins.............\n";
		
		my @uniqueProteins = sort keys %hash;
		#print "@uniqueProteins";
		
		return \@uniqueProteins;
	}
	
####################################################
# Subroutine findPPIB
####################################################
# Parameter
#	Reference to a array of PPI
#	Reference to unique SPB
# Return
#	Array of Unique elements 

sub findPPIB{
	my ($ppi, $spbs) = @_;
	my @ppi = @$ppi; # Array of Unique PPIs
	my @spbs = @$spbs; #Array of Differentially expressed genes 
	my @array = ();
	my %hash2 = ();
	
	foreach my $protein (@spbs)
		{
			$hash2{$protein}++;   #Finding the unique proteins
		}
		
	foreach my $ppis (@ppi)
	{
		my ($p1, $p2) = split ('\s', $ppis); #spliting the PPI into two proteins
		if (exists $hash2{$p1} && exists $hash2{$p2}) 
		{
			push (@array, $ppis);  #making the array of SNBs Subnetwork Biomarkers
		}
	}
	return \@array;
}

####################################################
# Subroutine findPPIB_oneGene
####################################################
# Parameter
#	Reference to a array of PPI
#	Reference to unique SPB
# Return
#	Array of Unique elements 

sub findPPIB_oneGene{
	my ($ppi, $spbs) = @_;
	my @ppi = @$ppi;
	my @spbs = @$spbs;
	my @array = ();
	my %hash2 = ();
	
	foreach my $protein (@spbs)
		{
			$hash2{$protein}++;
		}
		
	foreach my $ppis (@ppi)
	{
		my ($p1, $p2) = split ('\t', $ppis);
		if (exists $hash2{$p1} || exists $hash2{$p2})
		{
			push (@array, $ppis);
		}
	}
	return \@array;
}


# *****************************************
# Subroutine:  readFileNames
#******************************************
#Parameter:
#	Name of the directory
#Return:
#	Reference to an array containing file names
#******************************************
sub readFileNames{
	my ($dir) = @_;
	my @filename;
	
	opendir(DIR, $dir) or die $!;
	# my $i =1;
	while (my $file = readdir(DIR)) 
	{
		next if ($file =~ m/^\./);
		push (@filename, $file);
		#print "$i\n";$i++;
		
	}
	closedir(DIR);
	return (\@filename);
}

####################################################
# Subroutine cleanData
####################################################
# Parameter
#	filename of raw data
# Return
#	hash of cleanned data to file

sub cleanData{
	my ($filename) = @_;
	my $array = readFileToArray ($filename);
	my @array = @$array; #array of Filenames
	
	my $single = (); #contains all the data of a file in a single string except the headings
	my @newArray = (); #array where each element is a group of proteins for a single function
	my @newArray1 = (); #array of lines which do not end at ":"
	my %hash =(); #Hash of cleanned file Key: functional group name, Value: Genes seperated by tab
	
	foreach my $element (@array)
	{	
	
		if (substr ($element, -1 , 1) ne ":") #if last element is not ":"
		{
			push (@newArray1 ,$element);
			# print "$element\n";
		}
	
	
		# $element =~ s/\s//g;
		# $single = $single.$element;
	}
	
	$single = join ('', @newArray1);
	# print "$single\n";
	
	@newArray = split (/\./, $single);
	# print "$newArray[0]";
	
	foreach my $element1 (@newArray)
	{
		$element1 =~ s/\s//g;				 #removing all the white spaces including "tab", "whitespace" and "newline"
		(my $p1, my $p2) = split (':' , $element1); 	 #Splitting the element into Functional group and set of genes
		$p2 =~ s/,/\t/g;				 #removing "comma" in between the gene names and replacing it by "tab"
		$p2 =~ s/\([^)]*\)//g; 				 #removing the Alias, the other name of the proteins inside () 
		$p2 =~ s/\n//g;
		
	
		# print "$p2\n";
		if(exists $hash{$p1})
		{
			my $value = join("\t", $hash{$p1}, $p2);
			$hash{$p1} = $value;
		}
		
		else
		{
			$hash{$p1} = $p2;	
		}
	}
	
	return (\%hash);
}

####################################################
# Subroutine appendData
####################################################
# Parameter
#	Directory name to read
#	Filename to write
# Return
#	array of cleanned data to file

sub appendData{
	my ($dir, $writeFile) = @_;
	my $array_ref = readFileNames($dir);
	my @array_ref = @$array_ref;
	
	my $diseaseName = ();
	my @newArray = (); #storing (genes "\t" disease Name)
	my @genes = (); #storing all the genes from hash where group of genes is one element
	my @array = (); #storing genes where each gene is one element
	
	foreach my $file (@array_ref)
	{
		my $filename = $dir.$file;

		my $hash_ref = readFileToHash($filename);
		my %hash = %$hash_ref;
		($diseaseName) = split('\.', $file); #getting disease name from the filename

		my @genes = values(%hash);

		foreach my $element (@genes)
		{
			@array = split ('\s', $element);
			foreach my $genes (@array)
			{
				push (@newArray, join ("\t", $genes, $diseaseName));
			}
		}
	}
	
	writeArray ($writeFile, \@newArray);
	
}

####################################################
# Subroutine individualGenes
####################################################
# Parameter
#	Directory name to read the files
#	Directory to write
# Return
#	array of all genes to files
sub individualGenes{
		my ($dirRead, $dirWrite) = @_;
		
		my $array_ref = readFileNames($dirRead);
		my @array_ref = @$array_ref;
		
		
		
		foreach my $file (@array_ref)
		{
			my $filename = $dirRead.$file;

			my $hash_ref = readFileToHash($filename);
			my %hash = %$hash_ref;
						
			my @genes = values(%hash);
			my @newArray = ();

			foreach my $element (@genes)
			{
				my @array = split ('\s', $element);
				foreach my $genes (@array)
				{
					push (@newArray, join ("\t", $genes));
				}
			}
			my $writeFile = $dirWrite.$file;
			writeArray ($writeFile, \@newArray);
		}
	}


####################################################
# Subroutine genes_Disease
####################################################
# Parameter
#	Directory name to read the files
#	Directory to write
# Return
#	array of all genes to files
sub genes_Disease{
		my ($dirRead, $dirWrite) = @_;
		
		my $array_ref = readFileNames($dirRead);
		my @array_ref = @$array_ref;
		my $diseaseName = ();
		
		
		foreach my $file (@array_ref)
		{
			my $filename = $dirRead.$file;

			my $hash_ref = readFileToHash($filename);
			my %hash = %$hash_ref;
			($diseaseName) = split('\.', $file); #getting disease name from the filename
						
			my @genes = values(%hash);
			my @newArray = ();

			foreach my $element (@genes)
			{
				my @array = split ('\s', $element);
				foreach my $genes (@array)
				{
					push (@newArray, join ("\t", $genes,$diseaseName));
				}
			}
			my $writeFile = $dirWrite.$file;
			writeArray ($writeFile, \@newArray);
		}
	}
	
####################################################
# Subroutine findSNBs
####################################################
# Parameter
#	Reference to a array of PPIBs
# Return
#	Reference to array of SNBs
sub findSNBs{
		my ($ppib) = @_;
		my @ppib = @$ppib; #Array of PPIBs
		my %hash = ();
		my @sortedPPI = (); #Array of sorted PPIs
		my %hashofPPI = (); #Hash of sorted PPIs
		
		
		for (my $i = 0; $i < scalar @ppib; $i++)  #removing the dulicate PPIs in different order like "a  b" and "b  a"
		{
			my $temp = $ppib[$i];
			my @new = sort split ('\t', $temp);
			# print "@new\n";
			if ($new[0] ne $new[1])
			{
				my $sorted = join ("\t", @new);
				push (@sortedPPI, $sorted);
			}				
		}
		
		foreach my $PPIelement (@sortedPPI)
		{
			$hashofPPI{$PPIelement}++;
		}
		
		my @fCleanned = keys %hashofPPI;
		return \@fCleanned;
	}

####################################################
# Subroutine find_missing_genes
####################################################
# Parameter
#	reference to array of the elements of file 1
#	reference to array of the elements of file 2
# Return
#	reference to array of difference of two arrays
sub find_missing_genes{
	my ($array_1, $array_2) = @_;
	
	my @all_elements = ();
	my %hash = ();
	my @final = ();
	
	push (@all_elements, @$array_1, @$array_2);	#all the elements are push in same array
	
	foreach my $element (@all_elements)
	{
		$hash {$element} ++;			# makes a hash of all the elements... those are repeated will have a value of 2
	}
	
	foreach my $key (keys %hash)
	{
		if ($hash{$key} == "1")			# if the data are not repeated i.e. have a value 1
		{
			push (@final, $key);
		}
	}

return (\@final);
}



####################################################
# Subroutine parse_geneNames_from_file
####################################################
# Parameter
#	Reference to filename to read
#	Reference to filename to write
# Return
#	hash of genes to file

sub parse_geneNames_from_file{
	my ($file_read, $file_write) = @_; 	#user inputs filenames to read and write
	my %hash_of_genes = ();			#hash of the final result
	
	my $array_ref = readFileToArray($file_read); #reading the file to array
	my @array_ref = @$array_ref; #array of elements of the file
	
	foreach my $line (@array_ref)
	{
		chomp $line;
		if ($line =~ m/^DR.*;$/) #looking for the line starts from DR and ends at ";" a semicolon
		{
			$line =~ s/DR//;
			my @split_lines = split (";", $line); #splits the line from semicolon
			
			foreach my $part (@split_lines)	
			{
				my ($p1, $p2, $p3) = split (",", $part);	#line is seperated into 3 parts where first is the gene we need and third tells us the property (T,N,F,P)
				# print "\$p3 = $p3\n\n"
				if ($p3 =~ m/[TN]/) # searching for true positive (T) and false negetive (N)
				{
					$p1 =~ s/\s*//; #removes one or more white spaces from the string
					# print "$p3\n";
					$hash_of_genes{$p1} = $p3; #appending the all true positive and false negetive genes in hash with key = protein name and value = property
				}
			}
		}
	}
	
	print scalar keys %hash_of_genes, " genes were parased from the given file\n";
	#print @array_of_genes, "\n\n\n";
	
	writeHash_sort($file_write, \%hash_of_genes); #writing files to hash
}


####################################################
# Subroutine union_of_genes
####################################################
# Parameter
#	referece to array of genes
# Return
#	reference to array of union of genes

sub union_of_genes{
	my ($hash_ref) = @_;	
	
	my %hash_all_genes = ();			#hash to store the final appended data
	my @genes = keys %$hash_ref;			#taking the genes (keys of hash)
	foreach my $gene (@genes)
	{
		$hash_all_genes{$gene}++;		#writing unique genes to hash
	}
	
	my @data = keys %hash_all_genes;
	# print "@data\n";
	return (\@data);
}


####################################################
# Subroutine parse_frequent_patterns
####################################################
# Parameter
#	reference to array of the elements of the file
# Return
#	reference to hash of frequent pattern 
sub parse_frequent_patterns{
	my ($array_ref) = @_;	
	my $p2 = ();	
	my %hash_all_genes = ();			#hash to store the final data
	my @new_array= ();		#storing all the frequent pattern that is storing the key (main gene we have) and value (the matching frequent patterns)
	
	foreach my $line (@$array_ref)
	{
		# print "Line = $line\n";
		chomp $line;
		if (($line =~ m/^>.*/) || ($line =~ m/^\s.*\[occurs frequently\]/) ) #looking for the line to fit in for te "@new _array"
		{
			push (@new_array, $line);
		}
		
	}
	
	foreach my $new_line (@new_array)
	{
		if ($new_line =~ m/^>.*/)
		{
			(my $p1, $p2, my $p3) = split ('\|', $new_line);   #getting the key for hash
			# print "$p2\n";
			$new_line =~ s/.*//;
		}
		
		else
		{
			$new_line =~ s/>//;					#eleminating ">" form the new line
			$new_line =~ s/:\s*\[occurs frequently\]//;		#eleminating ":   [occurs frequently]"  form the new line
		}
		
		$hash_all_genes{$p2} .= "\t$new_line"; 				#putting the data to hash
	}
	
	return (\%hash_all_genes);
}
	



-1