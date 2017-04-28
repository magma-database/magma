test non-persistent integration
commitMcForNpMcTest

	| mc |
	mc := MagmaCollection new.
	mc
		add: 'one' ;
		add: 'two' ;
		add: 'three'.
	clientSession commit:
		[ clientSession root at: 'testNpIntegrationForMagmaCollections' put: mc ]