$file="Quiz1_data.txt";

print "Original file content-->\n";

open (<quiz>,$file);
@data=<quiz>;

foreach (@data){
	print $_."\n";
}
   


 