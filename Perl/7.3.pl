use warnings;
use strict;
use v5.10;

my $size_of_set = 12;
my $max_length=30;
my $min_length = 15;

my @random_dna=();
srand(time|$$);

@random_dna = make_random_dna_set($size_of_set,$max_length,$min_length);
say "here is an array of $size_of_set,$max_length randomly generated";
say "with length between $max_length and $min_length";

foreach $w in (@random_dna){
	say $w;
	
	}
	
sub make_random_dna_set{
	
my ($min_lenght,$max_length,$size_of_set)=@_;
my $length;
my $dna;
my @set;
#create a set of random DNA

for (my $i = 0 ; $i < $size_of_set ; ++$i){
	
	$length = randomlength($min_length,$maxlength);
	$dna = make_random_dna($length);
	push(@set,$dna);
	
	}
	
return @set;
}

sub randomlenght {
	my($minlen.$maxlen)=@_;
	return (int rand ($maxlen-$minlen)+$minlen);
}

sub make_random_dna{
	my($length)=@_;
	my $dna;
	for (my $i=0; $i<$length;++$i)[
		$dna.=randomnucleotide();
	}
	return $dna;
	
}

sub randomnucleotide(){
	my (@nucleotide)=('A','C','G','T');
	return @randomnucleotide[int rand length @randomnucleotide];
	#return $nucs rand @randomnucleotide;
}	
	