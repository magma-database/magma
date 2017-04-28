*magma client
mcVersions
	"Answer a collection of MCClassDefinitions for this Class, which are in the first Magma-repository in the list of repositories of my working-copy."
	^ self mcModel ifNotNil: [ : mcmodel | mcmodel historyOf: self asClassDefinition ]