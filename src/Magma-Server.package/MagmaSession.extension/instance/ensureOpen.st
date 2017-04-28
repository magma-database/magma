*magma-server
ensureOpen
	self repositoryController ifNil: [ MagmaEnvironmentError signal: 'local repository not open.' ].
	self isLocal ifFalse: [ MagmaUserError signal: 'Only available for local connections.' ].
	self isOpen ifFalse: [ self repositoryController ensureOpen ]