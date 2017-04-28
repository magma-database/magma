testing
verifyBlockSamples: anArray
	self
		 assert: (Collection withAllSubclasses sort: self blockSamples first) = (Collection withAllSubclasses sort: anArray first) ;
		 assert: (anArray second value: #Integer) == Integer ;
		 assert: anArray third value = #MaFixtureFactory ;
		 assert: anArray fourth value = ('HELLO' -> 'WORLD') ;
		 assert: anArray fifth value = #(2 4 6 8 10 )