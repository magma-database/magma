building
record
	"Record my successful commit in the places that need to know."
	commitPackage objectsDo: 
		[ : eachBuffer | 
		(result newObjectBuffers includesKey: eachBuffer oid) ifFalse: 
			[ committed 
				at: eachBuffer oid
				put: eachBuffer copyWithSameBuffer ].
		eachBuffer classId = MagmaClassIdManager magmaCounterClassId ifTrue: 
			[ result addToBeRefreshed: (Dictionary new
					at: eachBuffer oid
						put: eachBuffer copyWithSameBuffer ;
					yourself) ] ].
	result changedObjectBuffers: committed