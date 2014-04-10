my $dir="G:\\Dropbox\\Mondal_Perl\\Midterm_Sophomore\\dataset";
opendir DIR, $dir or die "cannot hello goo open dir $dir: $!";
my @file= readdir DIR;
closedir DIR;
print "@file\n";
