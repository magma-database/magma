testing
isLocked

	^(changes includesKey: #lock) and: [ changes at: #lock ]