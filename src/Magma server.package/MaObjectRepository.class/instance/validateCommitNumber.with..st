actions
validateCommitNumber: aMaCommitLogRecord with: aMaCommitLogEntry 
	aMaCommitLogRecord ifNotNil: 
		[ "I could be a warm backup receiving previously-written commit-log entries.  Be absolutely positive it is the correct one!"
		aMaCommitLogEntry result commitNumber = (self commitNumber + 1) ifFalse: 
			[ MagmaWrongCommitNumber new
				expectedCommitNumber: self commitNumber + 1 ;
				signal ].
		aMaCommitLogRecord branchCode ~= filer branchCode ifTrue: [ MagmaDifferentBranch signal ] ]