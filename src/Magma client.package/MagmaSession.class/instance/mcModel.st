code base
mcModel
	"Answer the persistent codeBase object so that you may commit additions to it."
	^ self codeBase ifNotNilDo: [ : cb | cb mcModel ]