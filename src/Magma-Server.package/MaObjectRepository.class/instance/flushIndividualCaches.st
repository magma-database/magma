recovery
flushIndividualCaches
	self openDbFilesDo: [ : eachFile : eachFileId | eachFile maCommit ]