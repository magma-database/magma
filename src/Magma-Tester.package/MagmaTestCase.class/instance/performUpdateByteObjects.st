other small tests
performUpdateByteObjects
	| root |
	clientSession immutabilityStrategy: Object immutabilityStrategy.
	root := clientSession root.
	clientSession
		 abort ;
		 commit:
			[ (root at: 'testUpdateByteObjects') first
				at: 1
				put: $H.
			(root at: 'testUpdateByteObjects') last
				at: 1
				put: $H asciiValue ].
	clientSession immutabilityStrategy: MaImmutabilityStrategy new