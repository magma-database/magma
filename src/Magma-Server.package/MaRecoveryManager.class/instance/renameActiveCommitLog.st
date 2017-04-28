file
renameActiveCommitLog
	"To support one or more warm backups, a staging directory should be used in conjunction with Banyan (or any external copy script) to copy the files to the remote directories.  To make this easier, the current file is written in the repository directory and, when later closed, moved to the separate staging directory (commits) when it is safe to be copied to the warm backup's commitLogs.
	If the image crashes, the active commit.log file is still in the repository directory."
	commitLogFile ifNotNil: 
		[ MagmaSoftwareError signal: 'expected the active-commits file to be closed.' ].
	self hasActiveCommitLog ifTrue: 
		[ self directory 
			rename: self activeCommitLogFilename
			toBe: (self commitLogDirectory fullNameFor: self archiveCommitLogFilename) ]