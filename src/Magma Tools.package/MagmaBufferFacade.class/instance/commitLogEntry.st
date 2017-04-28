access
commitLogEntry
	"The MaCommitLogEntry that contained this buffer."
	^ self commitRecord ifNotNilDo: [ : cr | controller materializeCommitLogEntry: cr ]