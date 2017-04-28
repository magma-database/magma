private
commitPackage
	"The MaCommitPackage that contained this buffer."
	^ self commitLogEntry ifNotNilDo: [ : cle | cle commitPackage ]