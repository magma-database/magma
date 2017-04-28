association tests
testAddAssociation
	"self run:#testAddAssociation"
	"self debug:#testAddAssociation"
	
	| dict |
	dict := self newDict.
	dict at: #a put: 1.
	dict at: #b put: 2.
	self assert: (dict at: #a) = 1.
	self assert: (dict at: #b) = 2.
	
	dict at: #a put: 10.
	dict at: #c put: 2.
	
	self assert: (dict at: #a) = 10.
	self assert: (dict at: #b) = 2.
	self assert: (dict at: #c) = 2
	
	