accessing
readSetCountByClass
	^ (readSet keys collect:
		[ : each | (each maIsMutatingProxy and: [ each maRealObjectIsReified ])
			ifTrue: [ each maOriginalClass ]
			ifFalse: [ each class ] ]) asBag sortedCounts