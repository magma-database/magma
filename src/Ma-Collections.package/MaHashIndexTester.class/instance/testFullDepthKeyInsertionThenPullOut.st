tests
testFullDepthKeyInsertionThenPullOut

	self timeLimit: self defaultTimeLimit.

	self
		keySizes: self keyAndRecordSizesToTest key
		withRecordSizes: self keyAndRecordSizesToTest value
		run: #runFullDepthKeyInsertionThenPullOut