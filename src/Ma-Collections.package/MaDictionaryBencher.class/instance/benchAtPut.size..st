as yet unclassified
benchAtPut: aDictClass size: aCollectionSize

	| coll dict time shuffled |
	coll := self createCollectionOfSize: aCollectionSize.
	time := OrderedCollection new.
	10 timesRepeat: [
		dict := aDictClass new.
		shuffled := coll shuffled.
		Smalltalk garbageCollect.
		time add: [ shuffled do: [:each | dict at: each put: each ] ] timeToRun
	].		

	^ time average asFloat