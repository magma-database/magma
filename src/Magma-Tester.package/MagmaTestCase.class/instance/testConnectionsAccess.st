other small tests
testConnectionsAccess
	| conns |
	conns := self class magmaServerLocation connections.
	self
		 assert:
			(conns anySatisfy:
				[ : each | each userId = 'client1' ]) ;
		 assert:
			(conns anySatisfy:
				[ : each | each userId = 'client2' ]) ;
		assert: (conns allSatisfy: [ : each | each lastAccess notNil ])