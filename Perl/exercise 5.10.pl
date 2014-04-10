print "COMING UP... \n";
print "OUTPUT FOR EXERCISE 5.10\n\n";

$output = "temp.txt";

unless (open(WR, ">$output")){
print "Cannot open the output file $output\n";
exit;
}

print "This a not a test program\n";


if (unlink($output) == 0) {
    print "File deleted successfully.";
} else {
    print "File was not deleted.";
}

print WR "This is not a test program";