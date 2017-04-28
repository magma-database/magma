client-requests
refreshSegmentIn: aMaRefreshSegmentRequest 
	(self collectionManagerFor: aMaRefreshSegmentRequest collectionOid) 
		load: aMaRefreshSegmentRequest segment
		upTo: (aMaRefreshSegmentRequest quantity min: 10000)
		where: aMaRefreshSegmentRequest expression
		withObjects: aMaRefreshSegmentRequest loadObjects
		except: aMaRefreshSegmentRequest exceptions.
	aMaRefreshSegmentRequest segment 
		collectBuffers: aMaRefreshSegmentRequest sessionId
		from: self
		using: aMaRefreshSegmentRequest readStrategy.
	self 
		renewServerNotificationsIn: aMaRefreshSegmentRequest segment
		for: aMaRefreshSegmentRequest sessionId.
	^ aMaRefreshSegmentRequest segment