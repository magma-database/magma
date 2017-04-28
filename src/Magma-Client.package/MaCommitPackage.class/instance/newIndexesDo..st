enumerate
newIndexesDo: oneArgBlock
	"For all largeCollections that have had one or more indexes added on this
	transaction, evaluate oneArgBlock with the instance of MagmaCollectionChanges that hasAddedIndexes."
	self allLargeCollectionChangesDo:
		[ :eachChanges |
		eachChanges hasAddedIndexes
			ifTrue:
				[ oneArgBlock value: eachChanges ] ]