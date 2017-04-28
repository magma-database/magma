private
initializeConflictingObjectsUsing: aMaObjectSerializer 
	conflictingOids do:
		[ : each | | eachConflictingObject |
		eachConflictingObject := aMaObjectSerializer objectWithOid: each.
		conflictingObjects add: eachConflictingObject -> eachConflictingObject conflictingObjectCopy ].
	"The catch-up process does this in pieces, so we now need to removeAll conflictingOids after 'transferring' them to conflictingObjects so it doesn't happen again for subsequent pieces."
	conflictingOids removeAll