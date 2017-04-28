*magma client
versions
	"Answer the MCVersions for this package."
	^ self mcModel ifNotNil:
		[ : model | model versionsForPackageNamed: self name ]