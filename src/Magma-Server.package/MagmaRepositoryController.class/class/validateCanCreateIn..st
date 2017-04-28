validation
validateCanCreateIn: aMagmaLocalLocation
	"Magma databases do not share the same directory.  Not only would it be hard to identify which files go with which repository, some of the filenames are based on oids, which would not always be unique across repositories."
	(aMagmaLocalLocation isMagmaRepository)
		ifTrue:
			[ MagmaUserError signal: aMagmaLocalLocation pathName, ' is already a Magma repository.' ]