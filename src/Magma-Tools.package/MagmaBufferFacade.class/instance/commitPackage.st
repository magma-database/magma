private
commitPackage
	"The MaCommitPackage that contained this buffer."
	^ self commitLogEntry ifNotNil: [ : cle | cle commitPackage ]