test querys - persistent populated
addSomeRemoveSome: aCollectionOrMagmaCollection 
	"For the most-effective tests, we should combine all the most complicated scenarios."
	self initializeNonPersistentSamples.
	"add some non-persistent objects"
	aCollectionOrMagmaCollection addAll: nonPersistentSamples.
	"remove some persistent members"
	(1 
		to: samples size
		by: 29) do: [ : n | aCollectionOrMagmaCollection remove: (self sampleAt: n) ].
	"remove some of the non-persistent members (that we added in step1)"
	1 
		to: nonPersistentSamples size
		by: 29
		do: [ : n | aCollectionOrMagmaCollection remove: (nonPersistentSamples at: n) ]