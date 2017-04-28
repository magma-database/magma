other small tests
performUpdateByteObjects
	| root |
	root := clientSession root.
	clientSession
		abort ;
		commit: 
			[ (root at: 'testUpdateByteObjects') first 
				at: 1
				put: $H.
			(root at: 'testUpdateByteObjects') last 
				at: 1
				put: $H asciiValue ]