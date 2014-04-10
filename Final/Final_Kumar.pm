use Kumar1;

#******************************************
#Subroutine: getMutation
#******************************************
#Parameter:
#	Reference to an array of file names
#Return:
#	Reference to an array of base mutation. Array elements are like C>A, T>G, etc
#	Reference to an array of amino acid mutation. Array elements are like Q15K, R155H, etc
#*****************************************************************************

sub getMutation{
my ($arrayFile)=@_;
my @arrayFile = @$arrayFile;
my @arrayofMutatedBase=();
my @arrayofMutatedAA=();
foreach my $file (@arrayFile){
	$file="C:/Users/Kumar/Desktop/Dropbox/Mondal_Perl/Final/Data/".$file;
	my $arrayRef = readFileToArray($file);
	my @arrayBase=@$arrayRef;
	foreach my $base (@arrayBase){
			if ($base =~ /^\s*HGMD/){
				next;
			}
			else{	
				chomp $base;
				my @splitBase = split('\s',$base);
				my $badBase = $splitBase[3];
				push (@arrayofMutatedBase,substr $badBase, length($badBase)-3,3);
				push(@arrayofMutatedAA,$splitBase[4]);
			}
	}		
}	 	
	return (\@arrayofMutatedBase,\@arrayofMutatedAA);
}	


#**********************************************
#Subroutine: getSample
#**********************************************
#Parameter:
#	Reference to an array of base mutation or amino acid mutation found using getMutation
#Return:
#	Reference to an array of mutated base or amino acid. Array elements are 1st character of
#	mutation
#***********************************************


sub getSample{
my ($basecollect)=@_;
my @basecollect = @$basecollect;
my @base = ();
foreach my $base (@basecollect){
	
	push (@base,substr $base, 0,1);		
}
return \@base;	
}		


#**********************************************
#Subroutine: frequencyDistribution
#**********************************************
#Parameter:
#	Reference to an array of sample data such as mutated base, output of getSample
#Return:
#	Reference to a hash of frequency distribution: key = base name, value = TAB separated 
#	FREQUENCY and %FREQUENCY
#***********************************************


sub frequencyDistribution{
my ($baseRef) = @_;
my @arrayBase = @$baseRef;
my %hashBase = ();
my $total=scalar @arrayBase;
foreach my $element (@arrayBase){
			if (exists $hashBase{$element}){
				$hashBase{$element}++;
			}
			else{
				$hashBase{$element}=1;
			}
						
}	
for my $key(keys %hashBase){
		my $calc = 100*$hashBase{$key}/$total;
		$hashBase{$key} = "$hashBase{$key}"."\t"."$calc";
}	 
return \%hashBase;
}	


# *****************************************5z
# Subroutine:  readFileName
#******************************************
#Parameter:
#	Name of the directory
#Return:
#	Reference to an array containing file names
#******************************************

sub readFileName{
my ($directory)=@_;
my $array_ref=readFileToArray($directory); 	
return $array_ref;		
}
-1;