client-requests
commitRecordsFrom: startNumber to: endNumber 
	"Answer a collection of MaCommitLogEntry which clients use to advance their image."
	| startTime size answer |
	answer := OrderedCollection new.
	startTime := Time millisecondClockValue.
	size := 0.
	recoveryManager 
		commitLogRecordsFrom: startNumber
		do: 
			[ : each | 
			size := size + each record size.
			answer add: each independentCopy ]
		until: 
			[ : each | 
			answer notEmpty and: 
				[ (Time millisecondsSince: startTime) > 1000 or: 
					[ size > 2000000 or: 
						[ "2 million bytes should be plenty at a time"
						each commitNumber >= endNumber ] ] ] ].
	^ answer asArray