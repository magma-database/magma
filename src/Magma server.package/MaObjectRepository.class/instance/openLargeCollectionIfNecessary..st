building
openLargeCollectionIfNecessary: aMagmaLargeCollection 
	"Must commit-guard this because I witnessed the flushCache process jumping in between when creating the manager and ensuring it open; the flush process absolutely requires all large-collection managers to be open."
	^ self commitCritical: 
		[ (self ensureManagerCreatedFor: aMagmaLargeCollection) ensureOpen ]