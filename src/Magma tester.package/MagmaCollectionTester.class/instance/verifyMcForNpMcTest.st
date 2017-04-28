test non-persistent integration
verifyMcForNpMcTest
	| mc |
	clientSession refresh.
	mc := clientSession root at: 'testNpIntegrationForMagmaCollections'.
	mc
		add: 'four' ;
		add: 'five'.
	self should: [ mc size = 5 ].
	self should: [ (mc asArray: 5) asSet = #('one' 'two' 'three' 'four' 'five' ) asSet ]