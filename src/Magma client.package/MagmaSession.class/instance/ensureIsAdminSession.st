high-availability
ensureIsAdminSession
	self isLocal ifFalse: 
		[ self allowFailover ifTrue: 
			[ MagmaUserError signal: 'Use a #newAdminSession to perform admin requests, please.' ] ]