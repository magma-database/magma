basic tests
testAtPutNil
	"self run: #testAtPut"
	"self debug: #testAtPut"
	
	| dict |
	dict := self newDict.
	dict at: nil put: 1.
	self assert: (dict at: nil) = 1.
	dict at: #a put: nil.
	self assert: (dict at: #a) = nil.
	dict at: nil put: nil.
	self assert: (dict at: nil) = nil.
	
	
	