enumerate
allLargeCollectionChangesDo: aBlock

	allLargeCollectionChanges ifNotNil: [ allLargeCollectionChanges do: aBlock ]