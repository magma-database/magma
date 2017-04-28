tests
runHeavyAddsAndRemoves
	| keys1 keys2 keysToRemove1 keysToRemove2 indexDef tempKeys1 tempKeys2 |
	keys1 := OrderedCollection new: 40000.
	keys2 := OrderedCollection new: 40000.
	indexDef :=
		(MaSearchStringIndex attribute: #yourself)
			keySize: index keySize ;
			beAscii ;
			yourself.
	Symbol allSymbolTablesDo:
		[ :e |
		2 atRandom even
			ifTrue: [ keys2 add: (indexDef indexHashFor: e) ]
			ifFalse: [ keys1 add: (indexDef indexHashFor: e) ] ].
	keysToRemove1 := OrderedCollection new.
	tempKeys1 := keys1 copy.  tempKeys2 := keys2 copy.
	keys1 size // 3 timesRepeat: [ keysToRemove1 add: (tempKeys1 remove: tempKeys1 atRandom) ].
	keysToRemove2 := OrderedCollection new.
	keys2 size // 3 timesRepeat: [ keysToRemove2 add: (tempKeys2 remove: tempKeys2 atRandom) ].
	self
		addKeys: keys1;
		removeKeys: keysToRemove1;
		addKeys: keys2;
		removeKeys: keysToRemove2;
		verifyIndex