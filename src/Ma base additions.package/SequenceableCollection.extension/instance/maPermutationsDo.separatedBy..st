*ma base additions
maPermutationsDo: aBlock separatedBy: separatorBlock 
	"I am a collection of other SequenceableCollections.  For each combination of elements in my element-Collections, value aBlock with the arguments Array of each combination of elements, and evaluate the separatorBlock between."
	| beforeFirst |
	beforeFirst := true.
	self maPermutationsDo:
		[ : each | beforeFirst
			ifTrue: [ beforeFirst := false ]
			ifFalse: [ separatorBlock value ].
		aBlock value: each ]