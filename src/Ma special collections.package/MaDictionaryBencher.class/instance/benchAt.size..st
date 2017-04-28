as yet unclassified
benchAt: aDictClass size: aCollectionSize

	| coll dict time shuffled |
	
	coll := self createCollectionOfSize: aCollectionSize.
	dict := aDictClass new.
	coll do: [:each | dict at: each put: each ].
	
	time := OrderedCollection new.
	10 timesRepeat: [
		shuffled := coll shuffled.
		Smalltalk garbageCollect.
		time add: [ 
			shuffled do: [:each | dict at: each] ] timeToRun
	].

	^ time average asFloat
	
