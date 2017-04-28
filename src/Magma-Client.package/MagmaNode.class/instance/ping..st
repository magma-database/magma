testing
ping: aMagmaRemoteLocation 
	"Answer the commitNumber of the primary repository, if it can be.  Otherwise, signal an error (probably NetworkError)."
	^ (self locations includes: aMagmaRemoteLocation) 
		ifTrue: [ (self sessionFor: aMagmaRemoteLocation) remoteCommitNumber ]
		ifFalse: 
			[ MagmaSoftwareError signal: aMagmaRemoteLocation printString , ' is not part of ' ]