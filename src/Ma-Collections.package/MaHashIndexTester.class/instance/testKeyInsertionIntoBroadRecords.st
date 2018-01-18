tests
testKeyInsertionIntoBroadRecords

	self
		keySizes: self keyAndRecordSizesToTest key
		withRecordSizes: self keyAndRecordSizesToTest value
		run: #runKeyInsertionIntoBroadRecords