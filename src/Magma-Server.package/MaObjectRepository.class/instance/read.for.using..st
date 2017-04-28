client-requests
read: oidInteger for: sessionId using: aMaReadStrategy 
	| result |
	self commitCritical: 
		[ result := MaReadResult byteArray: 
			(self 
				byteArrayAt: oidInteger
				using: (self 
						ensureReadStrategy: aMaReadStrategy
						forSession: sessionId)).
		self 
			renewServerNotificationsIn: result
			for: sessionId ].
	^ result