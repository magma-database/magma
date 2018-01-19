accessing
commitLogEntryAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitLogRecordAt: commitNumber) ifNotNil: [ : cr | MagmaSession materializeCommitLogEntry: cr ]