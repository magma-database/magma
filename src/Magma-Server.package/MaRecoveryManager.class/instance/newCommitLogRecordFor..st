commit-packages
newCommitLogRecordFor: aMaCommitLogEntry 
	| commitPackageRecord |
	commitPackageRecord := self preMadeCommitPackageRecord.
	commitPackageRecord
		record: (serializer resetOidManager serializeGraph: aMaCommitLogEntry) trimmedByteArray ;
		commitNumber: commitNumber ;
		timestamp: DateAndTime now ;
		branchCode: branchCode.
	^ commitPackageRecord independentCopy