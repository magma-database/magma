recover
hasActiveCommitLog
	^ commitLogFile notNil or: [ self directory fileExists: self activeCommitLogFilename ]