access
commitRecordAt: commitNumber 
	^ commitRecords 
		at: commitNumber
		ifAbsent: 
			[ 
			[ commitRecords 
				at: commitNumber
				put: (session commitLogRecordAt: commitNumber) ] 
				on: MagmaUnavailableCommitRecord
				do: [ : err | nil ] ]