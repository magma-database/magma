actions
write: aMaCommitLogEntry 
	self commitCritical: 
		[ | trimmedEntry |
		aMaCommitLogEntry
			registerUsing: self ;
			link ;
			record.
		self 
			write: aMaCommitLogEntry
			logged: true
			commitLogRecord: nil ]