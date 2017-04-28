recovery
rollforwardIfPossible
	^ recoveryManager isRollbackNeeded 
		ifTrue: 
			[ MagmaUserError signal: 'A rollback of the last incomplete commit is still needed.  Cannot roll forward until this is done.' ]
		ifFalse: 
			[ recoveryManager
				reapplyCommitPackagesUsing: self ;
				resetApplyFile ]