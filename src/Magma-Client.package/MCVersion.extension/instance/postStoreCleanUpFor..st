*magma-client-private
postStoreCleanUpFor: aMCMagmaRepository
	"Occasionally stubOut the missingVersions so we don't end up referencing too many versions."
	self info versionNumber \\ 10 = 0 ifTrue: [ aMCMagmaRepository trim ]