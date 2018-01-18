keys and value tests
testValues
	"self run:#testValues "
	
	| a1 a2 dict | 
	a1 := Association key: 'France' value: 'Paris'.
	a2 := Association key: 'Italie' value: 'Rome'.
	dict := self newDict.
	dict add: a1.
	dict add: a2.
	 
	self assert: (dict values size ) = 2.
	self assert: (dict values includes: 'Paris').