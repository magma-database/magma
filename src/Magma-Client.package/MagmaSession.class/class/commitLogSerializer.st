accessing
commitLogSerializer
	^ CommitLogSerializer ifNil: [ CommitLogSerializer := self newCommitLogSerializer ]