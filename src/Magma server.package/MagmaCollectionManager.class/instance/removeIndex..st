private
removeIndex: aMaHashIndex 
	aMaHashIndex
		close ;
		filesDo: [ : each | repository queueForDelete: each ].
	oidIndexes 
		remove: aMaHashIndex
		ifAbsent: 
			[ "normal"
			 ].
	keyIndexes 
		remove: aMaHashIndex
		ifAbsent: 
			[ "normal"
			 ]