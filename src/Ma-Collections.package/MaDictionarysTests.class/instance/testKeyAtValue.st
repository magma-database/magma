keys and value tests
testKeyAtValue
	"self run: #testKeyAtValue"
	"self debug: #testKeyAtValue"
	
	| dict |
	dict := self newDict.
	dict at: #a put: 1.
	dict at: #b put: 2.
	dict at: #c put: 1.
	
	self assert: (dict keyAtValue: 2) = #b.
	self assert: (#(c a) includes: (dict keyAtValue: 1)).
	"ugly may be a bug, why not having a set #a and #c"
	
	self should: [dict keyAtValue: 0] raise: Error
	
	
