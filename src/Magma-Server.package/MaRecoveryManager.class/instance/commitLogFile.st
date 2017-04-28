accessing
commitLogFile
	^ commitLogFile ifNil: [ self openCommitLog ]