accessing
byteArrayIndexOfLowestEntry
	"Answers nil if no entries on this record."

	self
		byteArrayIndexesFrom: 0
		do:
			[ :each | (self hasEntryAtByteArrayIndex: each) ifTrue: [ ^each ] ].
	^nil