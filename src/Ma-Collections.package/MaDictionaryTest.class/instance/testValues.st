keys and value tests
testValues
	"self run:#testValues "
	
	| a1 a2 a3 dict | 
	a1 := Association key: 'France' value: 'Paris'.
	a2 := Association key: 'Italie' value: 'Rome'.
	dict := self newDict.
	dict add: a1.
	dict add: a2.
	 
	self assert: (dict values size ) = 2.
	self assert: (dict values includes: 'Paris').
	
	a3 := Association new.
	dict add: a3.
	self assert: (dict values size ) = 3.
	self assert: (dict values includes: nil).
	
	
	
	
	
	


	
	