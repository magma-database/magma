tests
testPseudo
	"(self run: #testPseudo)"
	"true and false are valid keys"
	
	| dict1  |
	dict1 := self newDict.
	self shouldnt: [dict1 at: true put: #true] raise: Error.
	self assert: (dict1 at: true) = #true.
		
	self shouldnt: [dict1 at: false put: #false] raise: Error.
	self assert: (dict1 at: false) = #false.