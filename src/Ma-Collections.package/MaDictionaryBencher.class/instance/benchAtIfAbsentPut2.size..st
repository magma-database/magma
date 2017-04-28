as yet unclassified
benchAtIfAbsentPut2: aDictClass size: aCollectionSize

	" in this benchmark, we making a half of elements existing,
	while another half not,
	so, ifAbsentPut evaluating a block 50% of time"
	
	| coll coll2 dict time shuffled |
	coll := self createCollectionOfSize: aCollectionSize.
	coll2 := (coll first: (aCollectionSize // 2)) asOrderedCollection addAll: (self createCollectionOfSize: aCollectionSize //2 ).
	
	time := OrderedCollection new.
	10 timesRepeat: [
		dict := aDictClass new.
		shuffled := coll2 shuffled.
		Smalltalk garbageCollect.
		coll do: [:e | dict at: e put: e].
		time add: [ shuffled do: [:each | dict at: each ifAbsentPut: [ each ] ] ] timeToRun
	].		

	^ time average asFloat