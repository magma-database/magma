testing
verifyBlockSamples: anArray 
	self
		 assert: (Collection withAllSubclasses sort: self blockSamples first) = (Collection withAllSubclasses sort: anArray first) ;
		 assert: (anArray second value: #Integer) == Integer ;
		 assert: anArray third value = ('HELLO' -> 'WORLD')