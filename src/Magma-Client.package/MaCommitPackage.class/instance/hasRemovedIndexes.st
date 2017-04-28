testing
hasRemovedIndexes

	self
		allLargeCollectionChangesDo: [ :eachChanges | eachChanges hasRemovedIndexes ifTrue: [ ^true ] ].
	^false