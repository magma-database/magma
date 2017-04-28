initialize-release
cleanUp
	self bulkBecomeProxies.
	statistics ifNotNil: [ statistics release ].
	transaction unregister