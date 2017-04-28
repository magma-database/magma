keys and value tests
testWeakReject

	"self run:#testKeys "
	
	| dict dict2 | 
	dict := MaWeakValueDictionary new.
	dict at: 1 put: 2.
	dict at: 2 put: 3.
	dict at: 3 put: nil.
	dict at: 4 put: 5.

	dict2 := dict reject: [:each | each isNil ].	