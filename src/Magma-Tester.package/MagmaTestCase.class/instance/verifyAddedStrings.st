test forward recovery
verifyAddedStrings
	clientSession timeoutSeconds: 172800 "2 days".
	"We can't know whether the last commit actually succeeded and on its way back before the server was killed.  If it did, then the local will be one behind the remote.  Otherwise, they'll be equal."
	self assert: forwardRecoveryRequirement size > 3.
	self assert: (self remoteStringCollection size - forwardRecoveryRequirement size 
			between: -1
			and: 1)