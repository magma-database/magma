*ma-core
maAddAll: aSequenceableCollection afterIndex: integerIndex

	aSequenceableCollection reverseDo: [:each | self add: each afterIndex: integerIndex ].
	^aSequenceableCollection
