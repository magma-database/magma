*magma-client
magmaCommitLogEntry
	^ self magmaSession ifNotNil: [ : sess | sess commitLogEntryAt: self magmaCommitNumber ]