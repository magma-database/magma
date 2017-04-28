basic tests
testAtError
	"self run: #testAtError"
	
	| dict |
	dict := self newDict.
	dict at: #a put: 666.
	self shouldnt: [ dict at: #a ] raise: Error.
	self should: [ dict at: #b ] raise: Error.
	
	