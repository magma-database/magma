code base
mcModel
	"Answer the persistent codeBase object so that you may commit additions to it."
	^ self codeBase ifNotNil: [ : cb | cb mcModel ]