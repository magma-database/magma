as yet unclassified
benchAtIfAbsent: aDictClass size: aCollectionSize

	" in this benchmark, we making a half of keys present,
	while another half absent. 
	so, an absent block will be evaluated 50% of time"
	
	| coll coll2 dict time shuffled count |

	coll := self createCollectionOfSize: aCollectionSize.
	coll2 := (coll first: (aCollectionSize // 2)) asOrderedCollection addAll: (self createCollectionOfSize: aCollectionSize //2 ).
	
	time := OrderedCollection new.
	10 timesRepeat: [
		count := 0. 
		dict := aDictClass new.
		shuffled := coll2 shuffled.
		Smalltalk garbageCollect.
		coll do: [:e | dict at: e put: e].
		time add: [ shuffled do: [:each | dict at: each ifAbsent: [ count := count +1 ] ] ] timeToRun
	].		

	^ time average asFloat