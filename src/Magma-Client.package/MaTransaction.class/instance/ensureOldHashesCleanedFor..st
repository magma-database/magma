actions
ensureOldHashesCleanedFor: anObject
	"What we need to do here is capture the before-keys of any object which, potentially belonging to a MagmaCollection, potentially changing its key by way of its instVars being changed so that we may, in modified: actually determine whether we should record the changed-key in my commitPackage."

	potentialKeysChange 
		removeKey: anObject
		ifAbsent: [ "do nothing" ]