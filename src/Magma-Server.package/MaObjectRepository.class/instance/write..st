actions
write: aMaCommitLogEntry 
	self commitCritical: 
		[ aMaCommitLogEntry
			registerUsing: self ;
			link ;
			recordUsing: self.
		self 
			write: aMaCommitLogEntry
			logged: true
			commitLogRecord: nil ]