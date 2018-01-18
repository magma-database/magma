accessing
at: logicalIndex put: anInteger 
	| bytes |
	logicalIndex > self maxSize ifTrue: [ MaUserError signal: 'Out of range.' ].
	bytes := self newRecordBytes.
	bytes
		maUint: broker recordSize * 8
		at: 0
		put: anInteger.
	broker 
		writeFrom: bytes
		at: logicalIndex - 1.
	^ anInteger