building
recordObjectConflictWith: aMagmaClientConnection on: oidInteger

	(commitConflicts
		detect: [ : each | each conflictingConnection = aMagmaClientConnection ]
		ifNone: [ commitConflicts add: (MagmaCommitConflict connection: aMagmaClientConnection) ])
			addConflictingOid: oidInteger.
	^ self