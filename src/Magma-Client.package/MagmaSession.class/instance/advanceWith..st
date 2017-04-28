private
advanceWith: aMaCommitLogEntry 
	| result |
	result := MaFailedCommitResult new.
	self
		advanceWith: aMaCommitLogEntry
		accumulatingConflictsIn: result.
	^ result