as yet unclassified
benchAtIfAbsentPut: aDictClass size: aCollectionSize

	| coll dict time shuffled |
	coll := self createCollectionOfSize: aCollectionSize.
	time := OrderedCollection new.
	10 timesRepeat: [
		dict := aDictClass new.
		shuffled := coll shuffled.
		Smalltalk garbageCollect.
		time add: [ shuffled do: [:each | dict at: each ifAbsentPut: [ each ] ] ] timeToRun
	].		

	^ time average asFloat