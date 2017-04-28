*magma server
process
	| answer doneIndicator |
	doneIndicator := true.
	answer := super process.
	answer 
		ifEmpty: [ self ensureWarmBackupNode ]
		ifNotEmpty: 
			[ "Sending back some commit-records, but did we make it to the end?  If so, we can add as a warm-backup right now."
			answer last commitNumber = repositoryController commitNumber 
				ifTrue: [ self ensureWarmBackupNode ]
				ifFalse: 
					[ self ensureNoWarmBackupNode.
					doneIndicator := false ] ].
	^ answer -> doneIndicator