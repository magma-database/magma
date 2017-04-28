file
openCommitLog
	logStartTime := Time millisecondClockValue.
	^ commitLogFile := (self directory fileNamed: self activeCommitLogFilename)
		binary ;
		setToEnd ;
		yourself	"just to be safe"