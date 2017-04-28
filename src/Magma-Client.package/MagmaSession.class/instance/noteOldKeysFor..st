large collections
noteOldKeysFor: anObject 
	"If anObject is in an indexed MagmaCollection and your program *is about to* change its keys, you must call this method or it will continue to be indexed under its old keys.  Emphasize, that you call this method *before* you change the keys, not after."
	guard critical: [ transaction ensureOldHashesCapturedFor: anObject ]