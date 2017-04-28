copying
copyWithNewLargeCollectionChanges

	^self copy
		allLargeCollectionChanges: (self allLargeCollectionChanges collect: [ :each | each copy ])
