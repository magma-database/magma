*magma server
process

	^ self repository
		readAnchorFor: sessionId
		using: readStrategy