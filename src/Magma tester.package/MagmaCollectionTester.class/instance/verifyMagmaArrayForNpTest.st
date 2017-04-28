test non-persistent integration
verifyMagmaArrayForNpTest
	| arr |
	arr := clientSession refresh root at: 'testNpIntegrationForMagmaArrays'.
	arr 
		at: 1
		put: 'one'.
	self should: [ arr size = 5 ].
	arr 
		at: 501
		put: 'five-hundred, one'.
	self should: [ arr size = 501 ].
	self should: [ (arr select: [ : e | e notNil ]) size = 3 ].
	6 
		to: 500
		do: [ : n | self should: [ (arr at: n) = nil ] ]