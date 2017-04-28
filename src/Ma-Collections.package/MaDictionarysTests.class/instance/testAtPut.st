basic tests
testAtPut
	"self run: #testAtPut"
	"self debug: #testAtPut"
	
	| adictionary |
	adictionary := self newDict.
	adictionary at: #a put: 3.
	self assert: (adictionary at: #a) = 3.
	adictionary at: #a put: 3.
	adictionary at: #a put: 4.
	self assert: (adictionary at: #a) = 4