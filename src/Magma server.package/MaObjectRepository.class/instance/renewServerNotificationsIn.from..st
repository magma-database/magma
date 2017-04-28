actions
renewServerNotificationsIn: aMagmaServerResult from: aMaTransactionLogEntry 
	aMagmaServerResult serverNotifications: aMaTransactionLogEntry renewServerNotifications.
	aMagmaServerResult serverNotifications keysAndValuesDo: 
		[ : eachKey : eachSet | 
		aMagmaServerResult serverNotifications 
			at: eachKey
			put: (eachSet asArray collect: 
				[ : eachOid | 
				self 
					byteArrayAt: eachOid
					using: MaReadStrategy deep ]) ]