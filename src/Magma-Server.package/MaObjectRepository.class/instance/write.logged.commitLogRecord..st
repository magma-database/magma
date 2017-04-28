actions
write: aMaCommitLogEntry logged: shouldLog commitLogRecord: aMaCommitLogRecord 
	"This is the main 'write' logic for Magma.  It is used for 1) regular commits, 2) recovering from records in the commits.log file and, 3) updating warm backups.  Case 1 will pass a non-trimmed aMaCommitLogEntry and NO aMaCommitLogRecord (nil).  Cases 2 and 3 will pass a trimmed MaCommitLogEntry and the MaCommitLogRecord it was materialized from."
	| trimmedEntry commitLogRecord extraBuffersToRefresh |
	self 
		validate: aMaCommitLogRecord
		with: aMaCommitLogEntry.	"I could be a warm backup receiving previously-written commit-log entries.  Be absolutely positive it is the correct one!"
	recoveryManager nextCommitNumber.
	self challengeOthersWith: aMaCommitLogEntry.
	"If aMaCommitLogRecord is specified (notNil), then we know aMaCommitLogEntry is already a trimmedCopy, otherwise aMaCommitLogEntry is for a new commit."
	trimmedEntry := aMaCommitLogRecord 
		ifNil: 
			[ aMaCommitLogEntry commitNumber: recoveryManager commitNumber.
			aMaCommitLogEntry trimmedCopy ]
		ifNotNil: [ aMaCommitLogEntry ].
	commitLogRecord := aMaCommitLogRecord ifNil: [ recoveryManager newCommitLogRecordFor: trimmedEntry ].
	"Don't log when we're *reading* from the log file to recover!  Nor should we send anything off to warm-backups.  Those will be caught up afterward."
	shouldLog ifTrue: 
		[ "To test rollback-recovery, we cannot log the commits because, even though the files are rolled back, they would then be forward-recovered to include the commitDisaster commit!  We cannot allow this because we compare the file hashes after the rollback."
		SimulateOutage ifFalse: 
			[ self restoreMode ifFalse: 
				[ "The recovery in an on-line system will be from the warm-backups.  Therefore send off to the warmBackups first so they have the best chance of being up to date."
				self sendToWarmBackups: commitLogRecord ].
			recoveryManager log: commitLogRecord ] ].
	extraBuffersToRefresh := self applyToCache: trimmedEntry.
	extraBuffersToRefresh do: [ : each | aMaCommitLogEntry refreshIfCountersOrStat: each using: self ].
	self
		initializeNextOid ;
		flushCacheSoon	"needed after recovery, doesn't hurt regular commits"