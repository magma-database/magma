recovery
indexForFileId: anInteger 
	"To support recovery of LargeCollections, we must replace the applied records to their prior-state, which is contained inside MaBeforeImageRecords."
	| indexId |
	indexId := 2r111111111111111 bitAnd: anInteger.	"15-bit index #"
	^ indexId = 0 
		ifTrue: [ memberIndex ]
		ifFalse: 
			[ (anInteger maIsBitSet: 16) 
				ifTrue: [ keyIndexes at: indexId ]
				ifFalse: [ oidIndexes at: indexId ] ]