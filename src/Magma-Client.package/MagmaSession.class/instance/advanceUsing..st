private
advanceUsing: aMaObjectSerializer 
	"Advance the state of the cached model forward by a reasonably-sized chunk of commits.  The 'chunk of commits' is obtained directly from the commit-logs on the server.  If the commit-log files are no longer available on the server, signal a MagmaUnavailableCommitRecord."
	| commitLogRecords result |
	result := MaFailedCommitResult new.
	commitLogRecords := self commitLogRecordsFrom: self commitNumber + 1.
	commitLogRecords do:
		[ : each | | commitLogEntry |
		commitLogEntry := aMaObjectSerializer resetOidManager materializeGraph: each record.
		self
			advanceWith: commitLogEntry
			accumulatingConflictsIn: result ].
	self bulkBecomeProxies.
	self inTransaction ifTrue: [ self checkIfTooFarBehind: result ]