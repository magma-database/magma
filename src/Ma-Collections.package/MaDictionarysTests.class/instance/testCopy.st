keys and value tests
testCopy

	"self run:#testKeys "
	
	| dict dict2 | 
	dict := self newDict.
	dict at: 1 put: 1.
	dict at: 2 put: 2.
	dict at: 3 put: 3.
	dict at: 4 put: 4.

	dict2 := dict copy.
	dict2 associationsDo: [:each | self assert: (dict at: each key) = each value ].
	self assert: dict size= dict2 size.

	