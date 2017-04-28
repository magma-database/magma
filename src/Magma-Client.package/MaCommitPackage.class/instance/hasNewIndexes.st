testing
hasNewIndexes
	"Don't use conform: or detect: because it forces creation of a collection for
	the new indexes."

	self
		allLargeCollectionChangesDo: [ :eachChanges | eachChanges hasAddedIndexes ifTrue: [ ^true ] ].
	^false
