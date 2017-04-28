access
commitLogEntryAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitRecordAt: commitNumber) ifNotNilDo: [ : cr | self materializeCommitLogEntry: cr ]