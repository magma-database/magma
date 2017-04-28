basic tests
testIncludesKey
	"self run:#testIncludesKey"
	"self debug:#testIncludesKey"
	
	| dict a1 a2 a3 |
	a1 := Association key: 'Italie'.
	a2 := Association new.
	a3 := Association key: 'France' value: 'Paris'.
	
	dict := self newDict.
	dict add: a1 .
	dict add: a2.
	dict add: a3.
	self assert: (dict includesKey: #France).
	self assert: (dict includesKey: 'France').
	self assert: (dict includesKey: #Italie).
	self assert: (dict includesKey: nil).	
		
	self assert: (dict at: 'France' ) = 'Paris'.
