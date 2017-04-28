*magma client
mcVersions
	"Answer a collection of MCMethodDefinitions for this method, which are in the first Magma-repository in the list of repositories of my working-copy."
	^ self mcModel ifNotNil: [ : mcmodel | mcmodel historyOf: self asMethodDefinition ]