as yet unclassified
readmeText

	^'I provide several independent, special-purpose collection classes that seem to be generally useful.

MaWeakIdentityKeyDictionary and MaWeakValueDictionary wrap a collection of their Smalltalk counterparts and keeps them all under 12-bits in size, thus minimizing the number of collisions due to Squeaks 12-bits identity hash.  These provide major improvement in the #removeKey: message.

MaTree is one of my first attempts at a Smalltalk collection.  I never actually used it though I decided to keep it around.  It''s API compatible with the other collections.  To play with an example:

	MaTree new
		add: ''Great Grandma'';
		add: ''Grandma'' asChildOf: ''Great Grandma'';
		add: ''Mom'' asChildOf: ''Grandma'';
		yourself


MaIntervalCollection is can efficiently track interval ranges and merge them when they get within their proximityThreshold.  This is useful for recording occupied space in a memory map, or perhaps grouping entities based on their proximity to each other.  Example:

	(MaIntervalCollection proximityThreshold: 1)
		addFrom: 5 to: 10;
		addFrom: 15 to: 20;
		addFrom: 25 to: 30;
		addFrom: 21 to: 24;
		yourself


MaLargeArrayOfNumbers is an auto-growing, never-shrinking array of numbers.  All numbers have the same number of bits available to represent them.  It maintains the collection in a single randomly-accessed file, and is therefore constrained by available disk space or the addressability of the file.

	MaLargeArrayOfNumbers create: filenameString bitSize: 32.
	myArray _ MaLargeArrayOfNumbers open: filenameString.
	myArray
		at: 10 put: 8734 ;
		at: 11 put: 6199 ;
		yourself
	"be sure to #close it when you are done."


MaHashIndex is another file-based, large-collection of uniformly-sized numbers.  It is much slower but more flexible than MaLargeArrayOfNumbers.  It allows pages between any two key ranges via:

	#upTo: countInteger keysAndValuesFrom: lowKey to: highKey startingAt: index

and pages between any two absolute positions via:

	#upTo: countInteger keysAndValuesFromIndex: lowIndex

Other features are:
	- supports key and value sizes from 16 to 256 bits
	- supports duplicate keys
	- includes test cases that demonstrate its capability and correctness

	MaHashIndex 
		create: fileNameString 
		keySize: 64 
		hashRecordSize: 10.
	myIndex := MaHashIndex open: filenameString.
	myIndex
		add: 8734 at: 10 ;
		add: 1212 at: 10 ;  "duplicate key ok"
		add: 6199 at: 11 ;
		yourself.
	"be sure to #close it when you are done."
'