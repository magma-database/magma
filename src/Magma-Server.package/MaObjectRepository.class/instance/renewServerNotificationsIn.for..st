actions
renewServerNotificationsIn: aMagmaServerResult for: sessionId 
	self 
		renewServerNotificationsIn: aMagmaServerResult
		from: (transactionLog entryFor: sessionId)