testing
isReachable
	"Answer whether the host specified by my host can be reached on the specified port."
	| socket |
	^ 
	[ socket := Socket newTCP 
		connectTo: (self hostAddress ifNil: [ ^ false ])
		port: port
		waitForConnectionFor: 10.
	socket closeAndDestroy.
	true ] 
		on: ConnectionTimedOut, ConnectionRefused
		do: [ : err | false ]