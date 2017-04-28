tests
testInsertionOfEndpointKeys

	self
		keySizes: self keyAndRecordSizesToTest key
		withRecordSizes: self keyAndRecordSizesToTest value
		run: #runInsertionOfEndpointKeys