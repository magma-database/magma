access
commitPackageAt: commitNumber
	"The MaCommitLogEntry that contained this buffer."
	^ (self commitLogEntryAt: commitNumber) ifNotNilDo: [ : cle | cle commitPackage ]