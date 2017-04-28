test non-persistent integration
verifyReaderForNpIntegrationTest
	clientSession refresh.
	self verifyReaderForNpIntegrationTest: (clientSession root at: 'testNpIntegrationForReaders')