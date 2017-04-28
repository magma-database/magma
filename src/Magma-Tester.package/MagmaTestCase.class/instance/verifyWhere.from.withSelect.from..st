private-querys tests
verifyWhere: mcSelectBlock from: aMagmaCollection withSelect: ocSelectBlock from: anOrderedCollection 
	| reader subcollection |
	reader := aMagmaCollection where: mcSelectBlock.
	subcollection := anOrderedCollection select: ocSelectBlock.
	reader isSorted 
		ifTrue: 
			[ self 
				assertMc: reader
				equals: subcollection ]
		ifFalse: 
			[ self 
				assertMc: reader
				includesAll: subcollection.
			#(#first #second ) do: 
				[ : each | 
				| sortedReader |
				sortedReader := reader 
					sortBy: each
					makeDistinct: true.
				self 
					assertMc: sortedReader
					equals: subcollection.
				sortedReader descend.
				self 
					assertMc: sortedReader
					equals: subcollection ] ]