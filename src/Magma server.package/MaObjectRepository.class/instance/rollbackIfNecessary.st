recovery
rollbackIfNecessary
	recoveryManager isRollbackNeeded ifTrue: 
		[ MagmaRepositoryDefinition runningTestCases ifFalse: 
			[ MagmaRollbackRecoveryNeeded signal: 'A partially flushed cache has been detected!  This repository will now be recovered.' ].
		recoveryManager rollbackUsing: self	"NOTE:  This replaces me in my repositoryController." ]