*magma-client
isImmutableInMagma
	"This is used to help determine whether I should be stored in Magma's 'readSet', which is used to track changes.  But changes to some objects, such as Symbols, Blocks, CompiledMethods or logically-referenced globals are not tracked.  Therefore, there is no reason to bloat the readSet (not to mention when refreshPersistentObjectsEvenWhenChangedOnlyByMe is true, it won't try to refresh the unrefreshable."

	^ self maInstSize = 0