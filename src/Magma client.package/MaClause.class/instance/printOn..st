printing
printOn: aStream

	super printOn: aStream.
	aStream 
		nextPut: $(; 
		nextPutAll: attribute ; 
		space;
		print: self lowKey;
		nextPutAll: '..' ;
		print: self highKey;
		nextPut: $)

