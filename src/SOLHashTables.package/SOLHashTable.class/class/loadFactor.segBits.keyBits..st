create
loadFactor: loadFactor segBits: numBits keyBits: keyBits
	"Create a new SOLHashTable.  The loadFactor represents, on average, how many nodes in the split-order list will be allocated for each available bucket in the internal 'pointers' array.  segBits determines the number of slots in each internal 'pointers' array before a new pointers array will be allocated into the hierarchy."
	^ super new
		
		loadFactor: loadFactor
		segBits: numBits
		keyBits: keyBits ;
		 yourself