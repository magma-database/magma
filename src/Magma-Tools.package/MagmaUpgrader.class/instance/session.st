accessing
session
	^ session ifNil:
		[ session := location newSession
			 userId: 'upgrader from 15 to 16' ;
			 ensureConnected ;
			 yourself ]