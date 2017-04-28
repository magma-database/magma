building
setLocked: aBoolean

	self hasLockSpecified
		ifTrue:
			[ self isLocked ~= aBoolean
				ifTrue:
					[ changes removeKey: #lock ] ]
		ifFalse:
			[ changes
				at: #lock
				put: aBoolean ]