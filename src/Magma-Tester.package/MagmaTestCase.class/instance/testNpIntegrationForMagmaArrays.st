test non-persistent integration
testNpIntegrationForMagmaArrays

	| arr |
	"First, test a completely non-persistent MagmaArray."
	arr := MagmaArray new.
	arr at: 5 put: 'five'.
	self should: [ arr size = 5 ].
	self should: [ (arr at: 5) = 'five' ].
	self should: [ (arr at: 1) = nil ].
	self
		should: [ arr at: 6 ]
		raise: Error.
	self
		remotePerform: #createMagmaArrayForNpTest in: 'client1' ;
		remotePerform: #verifyMagmaArrayForNpTest in: 'client2'