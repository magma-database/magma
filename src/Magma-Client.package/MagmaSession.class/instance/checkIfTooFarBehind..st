private
checkIfTooFarBehind: aMaFailedCommitResult 
	aMaFailedCommitResult hasConflicts ifTrue:
		[ (MagmaTooFarBehindConflict result: aMaFailedCommitResult) signal ]