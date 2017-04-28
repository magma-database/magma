*magma server
process

	^ self repository
		read: oid
		for: sessionId
		using: readStrategy