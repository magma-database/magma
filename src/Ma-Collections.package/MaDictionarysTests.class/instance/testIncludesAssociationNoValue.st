association tests
testIncludesAssociationNoValue
	"self run:#testIncludesAssociationNoValue"
	"self debug:#testIncludesAssociationNoValue"
	
	| dict a1 a3 |
	a1 := Association key: #Italie.
	a3 := Association key: #France value: 'Paris'.
	
	self assert: (a1 key = #Italie).
	self assert: (a1 value isNil).
	
	dict := self newDict.
	dict add: a1.
	dict add: a3.
	self assert: (dict includesKey: #France).
	self assert: (dict includesKey: #Italie).
	self assert: (dict at: #Italie) isNil.
	self assert: (dict at: #France) = 'Paris'

	
	
	