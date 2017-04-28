accessing
at: logicalIndex ifAbsent: aBlock 
	| bytes |
	(self includesKey: logicalIndex) ifFalse: [ ^ aBlock value ].
	broker 
		readInto: (bytes := self newRecordBytes)
		at: logicalIndex - 1.
	^ bytes 
		maUint: broker recordSize * 8
		at: 0