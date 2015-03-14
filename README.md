# input_parser
Deals with file I/O, sorting and formatting input, and properly displaying output

This was a fun exercise.  I broke the code out into three main areas: a class for formatting a record that handles a string, a class for sorting records that handles and array, and a runner class that calls the other class and wraps IO.  

RecordSanitizer handles all formatting of a record, as elaborated in the #format method.  There is some redundant functionality in these methods where the string is split into an array and then an operation is performed on an element and then string is then brought back together.  I still think it's better to keep all formatting in this class though, instead of breaking the record apart and passing various attributes to specific formatting classes.  That would be a lot more overhead, and there would be added complexity in stitching the record back together at the end.

The critical element that allowed the methods in this class to be clean is the fact that the input follows strict rules already, as noted in the directions. For example, delimiters don't appear in data values, hyphens only appear in dates, and middle initial will always be removed if it exists. 

InputSorter handles sorting in the different ways required by the instructions.  This class is relatively straightforward and leans heavily on #sort_by.  Tests were important here to verify that nested sorting and ties in sorts would be handled appropriately.

Runner is the class that will get instantiated by the user and is responsible for writing the formatted, sorted records to an output file. Besides reading the files into memory and setting up an output file, it relies on the other classes to do the heavy lifting in preparation for writing.

Were I to continue working on this code, the next steps would be:

1) Add specs around the runner class. All the private methods either delegate to the other classes or wrap very simple IO.  In addition, the final output.txt file is small enough that it is easy to visually inspect against the desired final output on the Cyrus code test page.  Thus it was easy to verify expectations without unit testing.  However, if the code were to get any more complex, I would definitely want to add them, at least for the public "#run" method.
2) Create a command line wrapper that can capture pathname arguments for input files instead of having the files hard-coded on initialization of a Runner instance.
3) Make script executable, so it can be called directly from the command line with the file arguments, instead of having to run the ruby interpreter.

