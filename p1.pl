@x = (1, 2, 3, 10);
print @x, "\n";
print "@x\n";

$len =  scalar @x;
print "Length of array \@x is: $len\n";
print scalar @x, "\n";

($length) = scalar @x;
print "1st element of \@x is: $length\n";

%h = (1 => 'aaa', 4 => 'bbb', 2 => 'ccc', 3 => 'ddd');
@key = keys %h;
@value = values %h;

print "hash keys without sorting: @key\n";
print "hash values without sorting:@value\n";

@key = sort keys %h;
@value = sort values %h;

print "hash keys after sorting: @key\n";
print "hash values after sorting:@value\n";

print "printing array elements using loops\n";
for($i = 0; $i < scalar @x; $i++)
{
	print "$x[$i]\n";
}

foreach $element (@x)
{
	print "$element\n";

}

foreach (@x)
{
	print "$_\n";

}

