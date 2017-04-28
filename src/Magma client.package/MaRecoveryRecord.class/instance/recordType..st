initialize-release
recordType: anInteger
	"record type indicates what kind of MaRecoveryRecord this is.  See the class-side hierarchy, #assignedRecordType methods for the values."

	^ byteArray
		maUint: 8
		at: self bufferPositionOfRecordType
		put: anInteger