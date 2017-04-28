private
ensureConnectedSession
	session ifNil: [ session := location findSession ].
	[ session
		 readStrategy: MaReadStrategy new ;
		 ensureConnected ]
		on: MagmaUserRequiredNotification
		do:
			[ : request | request resume: (MagmaUser id: 'mc user') ].
	^ session