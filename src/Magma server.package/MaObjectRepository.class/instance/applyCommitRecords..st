high-availability
applyCommitRecords: commitRecords 
	"Private - apply commitRecords to this repository."
	| branchCode |
	branchCode := self branchCode.
	self flushCritical: 
		[ commitRecords do: 
			[ : each | 
			| commitLogEntry |
			commitLogEntry := self recoveryManager materializeCommitLogEntryIn: each.
			"Note, we've already validated our branchCode (the sender of this method), so if we notice a change in the branchCode in a commit-log, we can safely assume the repository branched at that point, therefore we can update our branchCode."
			branchCode = each branchCode ifFalse: 
				[ branchCode := each branchCode.
				self branchCode: branchCode ].
			self 
				write: commitLogEntry
				logged: true
				commitLogRecord: each.
			self session advanceWith: commitLogEntry ] ].
	^ branchCode