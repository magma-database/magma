accessing
recordType
	"record type indicates what kind of MaRecoveryRecord this is.  See the class-side hierarchy, #assignedRecordType methods for the values."

	^ byteArray
		maUint: 8
		at: self bufferPositionOfRecordType