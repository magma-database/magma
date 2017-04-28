test misbehaving client
client2CommitAnyway
	"Client 2 should now be kicked off, even if isConnected doesn't know it.  This tests the auto-reconnection."
	| arr didRaise |
	arr := self getMisbehaveFixture.
	self
		 assert: clientSession isConnected ;
		 assert: clientSession inTransaction ;
		 assert: (arr at: 1) value = true ;
		 assert: (arr at: 2) value = 'client2 desired change' ;
		 assert: (arr at: 3) value = 'client2 gonna-fail change' ;
		assert: (((arr at: 4) at: 1) sum = (0-2000) ) ;
		assert: (((arr at: 4) at: 2) sum = (0-2000) ) ;
		assert: (((arr at: 4) at: 3) sum = (0-2000) ).
	didRaise := false.
	[ clientSession commit ]
		on: MagmaTooFarBehindConflict
		do:
			[ : err | didRaise := true.
			self
				 assert: err result conflictingObjects size = 1 ;
				 assert: err result conflictingObjects first value value = 'client2 gonna-fail change' ;
				 assert: err result conflictingObjects first key value = 'client1 value wins' ;
				 assert: err result conflictingObjects first key == (arr at: 3) ;
				 assert: (arr at: 1) = ('client1' -> 'client1 final value') ;
				assert: (((arr at: 4) at: 1) sum = (1000-2000) ) ;
				assert: (((arr at: 4) at: 2) sum = (2000-2000) ) ;
				assert: (((arr at: 4) at: 3) sum = (3000-2000) ).
			clientSession begin.
			err retry ].
	self
		 assert: didRaise ;
		 assert: clientSession isConnected ;
		 deny: clientSession inTransaction ;
		 assert: (arr at: 1) value = 'client1 final value' ;
		 assert: (arr at: 2) value = 'client2 desired change' ;
		 assert: (arr at: 3) value = 'client1 value wins' ;
		assert: (((arr at: 4) at: 1) sum = (1000-2000) ) ;
		assert: (((arr at: 4) at: 2) sum = (2000-2000) ) ;
		assert: (((arr at: 4) at: 3) sum = (3000-2000) )