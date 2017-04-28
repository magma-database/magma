access
commitRecordAt: anInteger 
	^ commitRecords 
		at: anInteger
		ifAbsent: 
			[ 
			[ commitRecords 
				at: anInteger
				put: (self readCommitRecordAt: anInteger) ] 
				on: MagmaUnavailableCommitRecord
				do: [ : err | nil ] ]