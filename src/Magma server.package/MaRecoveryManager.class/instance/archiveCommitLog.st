file
archiveCommitLog
	repository commitCritical: 
		[ commitLogFile ifNotNil: 
			[ commitLogFile close.
			commitLogFile := nil.
			self renameActiveCommitLog ] ]