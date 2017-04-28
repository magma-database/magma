test high-availability function
verifyHandlesFailedServer: playerName 
	| monitoringSession |
	monitoringSession := self newSessionAt: self class magmaServerLocation.
	monitoringSession connectAs: 'HA monitor in #' , thisContext selector.
	"First assert isHighlyAvailable.  We have flood processes running."
	self assert: monitoringSession isHighlyAvailable.
	
	[ self 
		remotePerform: #killVm
		in: playerName ] 
		on: NetworkError
		do: 
			[ : err | 
			"nothing expected because we're killing the server."
			 ].
	self waitForServerDown: playerName.
	"Invoke a request to the primary to force monitoringSession to realize it is no longer HA."
	
	[ playerName = 'server' 
		ifTrue: [ monitoringSession abort ]
		ifFalse: [ monitoringSession root ].
	monitoringSession isHighlyAvailable ] whileTrue: [ (Delay forSeconds: 2) wait ].
	monitoringSession disconnect