%hash =('dog', 12,
'robin', 13,
'asp', 14);
for $key (keys %hash){
	my $calc = 100*$hash{$key}/1000;
	$hash{$key} = "$calc"."\t"."$key";
	}
	
	
for $key (keys %hash){
print "$hash{$key}","\n";	
	}	