initialize-release
adjustLastKnownSize: anInteger 
	self lastKnownSize ifNotNil: [ self lastKnownSize: self lastKnownSize - anInteger ]