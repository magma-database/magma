commit-packages
timeToStartNewCommitLog
	^ (Time millisecondsSince: logStartTime) > self logArchiveFrequency