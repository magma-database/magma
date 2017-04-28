keys and value tests
testDictionaryConcatenation
	"self run: #testDictionaryConcatenation"
	
	
	| dict1 dict2 dict3 |
	dict1 := self newDict.
	dict1 at: #a put: 'Nicolas' ; at: #b put: 'Damien'. 
	
	dict2 := self newDict.
	dict2 at: #a put: 'Christophe' ; at: #c put: 'Anthony'.
	dict3 := dict1, dict2.
	
	self assert: (dict3 at: #a) = 'Christophe'.
	self assert: (dict3 at: #b) = 'Damien'.
	self assert: (dict3 at: #c) = 'Anthony'.
	

	