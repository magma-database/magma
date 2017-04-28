overriding
prepareForScan
	[ source scanProcess isTerminated ] whileFalse: 
		[ scanProcess progressor description: 'waiting for source search to complete...'.
		(Delay forSeconds: 1) wait ].
	super prepareForScan