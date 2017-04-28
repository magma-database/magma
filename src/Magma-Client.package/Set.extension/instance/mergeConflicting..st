*magma-client
mergeConflicting: aSet
	"aSet contains my version of the receiver, which was changed by another session."
	self addAll: aSet.
	^ true