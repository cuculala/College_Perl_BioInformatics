
use v5.10;
use Kumar;
my $ref_array=readFileToArray("G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\MidTerm_452\\dataset\\frequent_match.txt");
print scalar @$ref_array;
my @file = qw(Ksunchuu ram bahadur ram lama :: [ occurs frequently ] is occurs currently unavailabel now in the boka);
print length $file;
%french = (
        apple  => "kumar",
        pear   => "poivre",
        orange => "Leon Brocard",
        blue =>   "pomme",
        color  => "pomme",
        cotton   => "poivre",
        industry => "Leon Brocard",
        wala =>   "cula"
    );
%temp=();
@count = values %french;
print "COunting ";say scalar @count;
#print "val size\n";print length @vals;
grep{ $temp{$_}++} (values %french);
my $element;
for $element (0..@count)
{
	 last if $count[$element]=="asfs";
}
print "Found at index $element" if $element < @count;

#s/[(sunchuu)][(boka)]/kumar/
#print "FOundd\n" if ($file =~ s/:\s*\[occurs frequently\]// );

# foreach my $element (@$r)
# {
	# print "$element\n";
# }

#print "\n$file\n";