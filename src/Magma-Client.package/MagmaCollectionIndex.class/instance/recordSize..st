initialize
recordSize: anInteger
	"Only set this ONCE, when you create.  It is not changeable after the dictionary is created."

	(MaHashIndex validRecordSizes includes: anInteger)
		ifTrue: [ recordSize := anInteger ]
		ifFalse:
			[ MagmaUserError signal: 'recordSize must be one of ', MaHashIndex validRecordSizes printString ]