enumerate
removedIndexesDo: twoArgBlock
	"For all largeCollections that have had one or more indexes removed on this transaction, evaluate twoArgBlock.  The first argument is the collection (or oid of the collection if the receiver has serialized itself, the second is a collection of the indexes)."

	self allLargeCollectionChangesDo:
		[ :eachChanges |
		eachChanges hasRemovedIndexes
			ifTrue:
				[ twoArgBlock
					value: eachChanges collection
					value: eachChanges removedIndexes ] ]