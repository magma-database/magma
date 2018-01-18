creation
newWithKeySize: numberOfBitsInteger valueSize: valueSize recordSize: entriesInteger
	"Use this constructor only when you want to create in-memory cached-hash-index."
	(self validRecordSizes includes: entriesInteger) 
		ifFalse: [ MaUserError signal: 'recordSize must be one of ', self validRecordSizes printString ].
	(self validKeySizes includes: numberOfBitsInteger) 
		ifFalse: [ MaUserError signal: 'keySize must be one of ', self validKeySizes printString ].
	^ self new
		keySize: numberOfBitsInteger
		valueSize: valueSize
		hashRecordSize: entriesInteger ;

		writeNewRoot ;
		yourself