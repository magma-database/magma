test forward recovery
verifyAddedStrings
	"Set timeoutSeconds back.  30, right?"
	clientSession timeoutSeconds: 30.
	"We can't know whether the last commit actually succeeded and on its way back before the server was killed.  If it did, then the local will be one behind the remote.  Otherwise, they'll be equal."
	self assert: forwardRecoveryRequirement size > 3.
	self assert: (self remoteStringCollection size - forwardRecoveryRequirement size 
			between: 0
			and: 1)