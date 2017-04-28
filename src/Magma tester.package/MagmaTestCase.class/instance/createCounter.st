test MagmaCounter
createCounter
	clientSession commit: 
		[ clientSession root 
			at: 'testMagmaCounter'
			put: 
				(MagmaCounter new
					increment: 10 ;
					yourself) ]