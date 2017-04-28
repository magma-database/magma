test MagmaDictionary
verifyEnumerationOfMagmaDictionary
	| magmaDict dict s1 s2 |
	clientSession refresh.
	magmaDict := clientSession root at: #testMagmaDictionary.
	dict := Dictionary new.
	magmaDict keysAndValuesDo:
		[ : eachKey : eachVal | dict
			at: eachKey
			put: eachVal ].
	self
		 assert:
		(magmaDict collect:
			[ : each | each isNumber ifTrue: [ each squared ] ]) asArray asSet =
			(dict collect:
				[ : each | each isNumber ifTrue: [ each squared ] ]) asArray asSet ;
		 assert:
		(magmaDict select:
			[ : each | each isNumber and: [ each odd ] ]) asArray asSet =
			(dict select:
				[ : each | each isNumber and: [ each odd ] ]) asArray asSet.
	s1 := Set new.
	s2 := Set new.
	magmaDict do:
		[ : each | s1 add: each ].
	dict do:
		[ : each | s2 add: each ].
	self assert: s1 = s2