initializing
postInitialize

	recordNumbersPath := OrderedCollection new: self maxDepth.
	entryIndexPath := OrderedCollection new: self maxDepth.
	byteArrayIndexPath := OrderedCollection new: self maxDepth.
	recordPath := Array new: self maxDepth.
	self
		createPreMadeNewRecord;
		initializeRecordPathRecords