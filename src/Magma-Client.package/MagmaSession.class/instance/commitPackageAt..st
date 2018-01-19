accessing
commitPackageAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitLogEntryAt: commitNumber) ifNotNil: [ : cle | cle commitPackage ]