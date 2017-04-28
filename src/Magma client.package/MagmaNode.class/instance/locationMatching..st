accessing
locationMatching: aMaServerLocation 
	"There are locations at two levels, the Magma level and the Ma Client Server level.  The Magma-level (an instance of MagmaRemoteLocation) references an instance of the Ma client server's location (a MaServerLocation)."
	^ locations 
		detect: [ : each | each serverLocation = aMaServerLocation ]
		ifNone: [ nil ]