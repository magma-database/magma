access
commitLogEntryAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitRecordAt: commitNumber) ifNotNil: [ : cr | MagmaSession materializeCommitLogEntry: cr ]