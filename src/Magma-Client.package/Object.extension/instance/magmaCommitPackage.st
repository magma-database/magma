*magma-client
magmaCommitPackage
	"The package of objects which were part of the same commit as this objects last commit."
	^ self magmaSession ifNotNil: [ : sess | sess commitPackageAt: self magmaCommitNumber ]