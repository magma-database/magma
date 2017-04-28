test misbehaving client
verifyClient2Change
	| arr |
	clientSession abort.
	arr := self getMisbehaveFixture.
	self
		 assert: (arr at: 1) value = 'client1 final value' ;
		 assert: (arr at: 2) value = 'client2 desired change' ;
		 assert: (arr at: 3) value = 'client1 value wins' ;
		 assert: ((arr at: 4) at: 1) sum = (1000 - 2000) ;
		 assert: ((arr at: 4) at: 2) sum = (2000 - 2000) ;
		 assert: ((arr at: 4) at: 3) sum = (3000 - 2000)