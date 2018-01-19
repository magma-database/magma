access
commitLogEntry
	"The MaCommitLogEntry that contained this buffer."
	^ self commitRecord ifNotNil: [ : cr | MagmaSession materializeCommitLogEntry: cr ]