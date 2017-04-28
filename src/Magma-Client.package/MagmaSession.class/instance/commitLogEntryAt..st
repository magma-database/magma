accessing
commitLogEntryAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitLogRecordAt: commitNumber) ifNotNilDo: [ : cr | MagmaSession materializeCommitLogEntry: cr ]