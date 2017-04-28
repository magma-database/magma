test concurrency
initializeIndexedCollectionForConcurrencyTest
	| mc oc |
	oc := OrderedCollection new.
	mc := MagmaCollection new
		addIndex: (MaIntegerIndex attribute: #key) ;
		yourself.
	1 
		to: 500
		by: 3
		do: 
			[ : n | 
			n -> n asWords in: 
				[ : obj | 
				"skip the fifth element for the MagmaCollection, we'll add it later."
				n = 13 ifFalse: [ mc add: obj ].
				oc add: obj ] ].
	clientSession commit: 
		[ clientSession root
			at: 'testConcurrency_mc'
				put: mc ;
			at: 'testConcurrency_oc'
				put: oc ].
	fifthElement := oc at: 5.
	clientSession begin