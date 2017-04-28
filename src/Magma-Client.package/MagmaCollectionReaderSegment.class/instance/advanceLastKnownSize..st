initialize-release
advanceLastKnownSize: anInteger 
	lastKnownSize ifNotNil: [ self lastKnownSize: lastKnownSize + anInteger ]