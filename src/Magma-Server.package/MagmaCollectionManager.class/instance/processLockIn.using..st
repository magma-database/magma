private
processLockIn: aMaCollectionChanges using: aMagmaConnection

	aMaCollectionChanges hasLockSpecified
		ifTrue:
			[ aMaCollectionChanges isLocked
				ifTrue: [ self beLockedBy: aMagmaConnection ]
				ifFalse: [ self beLockedBy: nil ] ]