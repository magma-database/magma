test non-persistent integration
testNpIntegrationForMagmaCollections

	self
		remotePerform: #commitMcForNpMcTest in: 'client1' ;
		remotePerform: #verifyMcForNpMcTest in: 'client2'