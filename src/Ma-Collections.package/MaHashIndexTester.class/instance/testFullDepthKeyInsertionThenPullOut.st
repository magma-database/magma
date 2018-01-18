tests
testFullDepthKeyInsertionThenPullOut
	self
		keySizes: self keyAndRecordSizesToTest key
		withRecordSizes: self keyAndRecordSizesToTest value
		run: #runFullDepthKeyInsertionThenPullOut