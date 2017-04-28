*magma tester
getNextSequenceNumber
	^ self session commit: 
		[ (self session cacheAt: #testSequenceNumberGenerator)
			increment ;
			value ]