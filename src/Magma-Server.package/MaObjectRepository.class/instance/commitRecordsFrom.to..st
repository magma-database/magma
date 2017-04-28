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
			[ : each | size := size + each record size.
			answer add: each independentCopy ]
		until:
			[ : each | answer notEmpty and:
				[ (Time millisecondsSince: startTime) > 3000 or: [ each commitNumber >= endNumber or: [ size > 50000000 "50MB worth of updates at a time should be enough!" ] ] ] ].
	^ answer asArray