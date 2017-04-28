client-requests
upTo: anInteger oidsFromIndex: startIndex inLargeCollection: collectionOid using: aMaReadStrategy forSession: sessionId 
	| segmentResult |
	segmentResult := (self collectionManagerFor: collectionOid) 
		upTo: anInteger
		inSegmentFromIndex: (startIndex max: 1).
	segmentResult 
		collectBuffers: sessionId
		from: self
		using: aMaReadStrategy.
	self 
		renewServerNotificationsIn: segmentResult
		for: sessionId.
	^ segmentResult