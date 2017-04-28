connections
closeRepository
	self isLocal ifFalse: [ MaUserError signal: 'Only available for local connections.' ].
	guard critical: 
		[ self isConnected ifTrue: [ self disconnect ].
		self repositoryController close ]