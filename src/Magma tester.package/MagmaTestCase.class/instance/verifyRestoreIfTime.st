test backup/restore
verifyRestoreIfTime
"	timeToVerifyRestore ifTrue: [ self verifyRestore ]."
	timeToVerifyRestore ifTrue: [ self verifyHaFunctionality ]