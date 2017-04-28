test forward recovery
initializeForwardRecoveryFixture
	clientSession
		commit: 
			[ clientSession root 
				at: #testForwardRecovery
				put: { 
						(OrderedCollection new: 1).
						(OrderedCollection new: 1)
					 } ]