client-requests
readAnchorFor: sessionId using: aMaReadStrategy 
	^ self
		read: filer anchorOid
		for: sessionId
		using: aMaReadStrategy