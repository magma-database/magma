test non-persistent integration
testNpIntegrationForReaders

	self
		remotePerform: #commitReaderForNpIntegrationTest in: 'client1' ;
		remotePerform: #verifyReaderForNpIntegrationTest in: 'client2'