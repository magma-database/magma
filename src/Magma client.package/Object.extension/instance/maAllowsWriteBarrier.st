*magma client
maAllowsWriteBarrier
	"Override in subclasses, if desired."
"Objects *can* change during serialization (such as when the first instance of a new class is added, the classDefinitions will change), so we cannot #suspendWriteBarrierModifiedsWhile: serializing.  However, we don't want to pick up changes due to #maWantsPreSerialization, because that hook does not cause the readSet to expand when not using WriteBarrier, therefore we don't want it to when using the WriteBarrier (we want the behavior to be consistent)."
	^ self isImmutableInMagma not and: [ self class canUncompact and: [ self maWantsPreSerialization not ] ]