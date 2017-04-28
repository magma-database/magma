private
initializeConflictingObjectsUsing: aMaObjectSerializer 
	conflictingObjects := conflictingOids collect: 
		[ : each | 
		| eachConflictingObject |
		eachConflictingObject := aMaObjectSerializer objectWithOid: each.
		eachConflictingObject -> eachConflictingObject shallowCopy ]